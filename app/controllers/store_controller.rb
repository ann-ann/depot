class StoreController < ApplicationController
  
  skip_before_filter :authorize

  def index
  	@products = Product.order(:title)
  	@types = Type.all
  end

end