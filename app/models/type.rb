# Has a title
# Should have many books

class Type < ActiveRecord::Base

  has_many :product_types
  has_many :products, through: :product_types

  validates :name, presence: true, uniqueness: true

  def to_s
  	name
  end
end
