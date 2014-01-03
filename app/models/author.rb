class Author < ActiveRecord::Base
  has_many :product_authors
  has_many :products, through: :product_authors
end
