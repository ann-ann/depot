class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_save :count_price
  before_destroy :back_product_to_stock

  def count_price
    self.price = (product.price * quantity).to_f
  end

  def back_product_to_stock
    p = Product.find(self.product_id)
    p.in_stock += 1
    p.save
  end
end
