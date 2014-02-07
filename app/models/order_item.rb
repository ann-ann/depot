class OrderItem < ActiveRecord::Base

  validates_numericality_of :quantity, :price
  belongs_to :product
  belongs_to :order

  before_save :count_price
  after_destroy :back_product_to_stock

  def count_price
    self.price = (product.price * quantity).to_f
  end

  def back_product_to_stock
    product.in_stock += self.quantity
    product.save
  end

  def decrease_product_quantity
    product.in_stock += 1
    product.save
  end



  # def check_it
  #  if self.quantity > 1
  #     self.quantity -= 1
  #     self.save
  #     # TODO check if its fine??  
  #     self.decrease_product_quantity
  #     false
  #  else
  #    self.back_product_to_stock
  #    true
  #  end
  # end

end

  