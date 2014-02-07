class OrderItemsController < ApplicationController
  skip_before_filter :authorize
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order = current_order
    product = Product.find(params[:product_id])
    @order_item = @order.add_product(product)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to store_url }
        format.json { render json: @order_item, status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
  # TODO move it somewhere
    if @order_item.quantity > 1
      @order_item.quantity -= 1
      @order_item.save
      
      @order_item.decrease_product_quantity
    else
      @order_item.destroy
    end 

    respond_to do |format|
      format.html { redirect_to store_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :price, :quantity)
    end
end
