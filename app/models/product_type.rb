class ProductType < ActiveRecord::Base
  belongs_to :product
  belongs_to :type
end
