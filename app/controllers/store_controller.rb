class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    # @order = current_order  
    # @current_customer = current_customer
  end

end