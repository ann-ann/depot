# Book
# Should contain title, descirption, price and how many books in stock
# Should belong to author and category
# Should have many ratings from customers

class Product < ActiveRecord::Base 

  before_destroy :ensure_no_refs_by_any_order_item

  mount_uploader :image_url, ImageUploader
  
  has_many :product_authors
  has_many :authors, through: :product_authors
  has_many :ratings
  has_many :product_types
  has_many :types, through: :product_types
  has_many :order_items
  has_many :orders, through: :order_items 

  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'Price have to be not less that 0.01'}
  validates :title, uniqueness: true, length: {minimum: 10, message: 'Title have to be not less that 10 chars long'}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)}i,
    message: 'URL have to leads to link of jpg/png/gif image'
  }
  validates_numericality_of :in_stock, greater_than_or_equal_to: 0

  scope :in_stock, -> {where("in_stock > 0")}
  scope :books, -> { joins(:types).where("types.name = 'book'" ) }
  
  def in_stock?
    true if in_stock > 0
  end

  def to_s
    title
  end

  def ensure_no_refs_by_any_order_item
    if order_items.empty?
      true
    else 
      errors.add(:base, 'cannot be delated')
      false
    end
  end

  def get_rating
    ratings = Rating.where(product_id: self.id)
    rating = ratings.sum("rating") / ratings.count unless ratings.empty?
    rating || "havent been rated yet"
  end

end