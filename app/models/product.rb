class Product < ActiveRecord::Base
  
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :product_authors
  has_many :authors, through: :product_authors
  has_many :ratings
  # WHY I need it? for scope .books 
  has_many :product_types
  has_many :types, through: :product_types
  has_many :order_items

# TODO needs testing
  before_save :format_title

  before_destroy :ensure_no_refs_by_any_order_item

# TODO logging

# check in_stock before order

# check that user havent rate same book 

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01, message: 'Price have to be not less that 0.01'}
  validates :title, uniqueness: true, length: {minimum: 10, message: 'Title have to be not less that 10 chars long'}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)}i,
    message: 'URL have to leads to link of jpg/png/gif image'
  }

  scope :in_stock, -> {where in_stock: true}
  scope :books, -> { joins(:types).where("types.name = 'book'" ) }
  
  def order
    if in_stock
    # - add to categorizations
  else
    # -print message that book is not available
    end
  end
  
  def format_title
    self.title.capitalize!
  end

  def ensure_no_refs_by_any_order_item
    if order_items.empty?
      true
    else 
      errors.add(:base, 'cannot be delated')
      false
    end
  end

end

# A customer should be able to order a book if it's exist on a stock
# A customer should be able to rate a book only once