class StoreController < ApplicationController
  skip_before_filter :authorize_admin
  skip_before_filter :authorize
  def index
  	@products = Product.order(:title)
    # @order = current_order  
    # @current_customer = current_customer
  end

end