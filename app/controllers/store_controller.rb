class StoreController < ApplicationController
  skip_before_filter :authorize_admin
  skip_before_filter :authorize
  def index
  	@products = Product.order(:title)
  end

end