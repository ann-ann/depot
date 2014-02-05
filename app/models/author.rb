class Author < ActiveRecord::Base

  has_many :product_authors
  has_many :products, through: :product_authors

  validates :first_name, :last_name, presence: true
  validates :photo, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)}i,
    message: 'only jpg/png/gif image'
  }

  before_destroy :ensure_no_refs_by_any_products

  def ensure_no_refs_by_any_products
    if products.empty?
      true
    else 
      errors.add(:base, 'cannot be delated')
      false
    end
  end

  def to_s
    "#{first_name} #{last_name}"
  end
  
end
