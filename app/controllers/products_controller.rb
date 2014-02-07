class ProductsController < ApplicationController
  
  skip_before_filter :authorize 
  # GET /products/1
  # GET /products/1.json
  def show
    # to show only product in stock
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_path, notice: 'Invalid product'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @product }
      end
    end
    
  end

  def who_bought
    respond_to do |format|
      format.atom
    end
  end

end