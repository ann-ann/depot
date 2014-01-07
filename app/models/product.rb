class Product < ActiveRecord::Base 
# Should belong to author
  has_many :product_authors
  has_many :authors, through: :product_authors
# Should have many ratings from costomers
  has_many :ratings
# Should belong to category(type)
  has_many :product_types
  has_many :types, through: :product_types

  has_many :order_items

  before_destroy :ensure_no_refs_by_any_order_item

  has_many :order_items

# check in_stock before order

# check that user havent rate same book 
  
  # Should contain title, descirption, price and how many books in stock
  validates :title, :description, :image_url, presence: true
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
    
    # Client.where(first_name: 'Ryan').count
    # self.total_price = OrderItem.where(order_id: self.id).sum("price")
  
  end

end

# A customer should be able to order a book if it's exist on a stock
# A customer should be able to rate a book only once