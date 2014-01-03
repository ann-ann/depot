class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_save :count_price

# TODO refactor updating quanity after order 
  def count_price
  	self.price = (product.price * quantity).to_f
  end

end
