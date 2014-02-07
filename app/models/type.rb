class Type < ActiveRecord::Base

  has_many :product_types
  has_many :products, through: :product_types

  validates :name, presence: true, uniqueness: true

  # TODO move somewher. used same for authors
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
  	name
  end
end
