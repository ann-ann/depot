class AddressesController < ApplicationController



  def show
  end

  # GET /order_items/new
  def new
    @address = Address.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order = current_order
    @address = @order.add_address(address_type)

    respond_to do |format|
      if @address.save
        format.html { redirect_to order_url }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: 'new' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end

  end


  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to store_url}
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :order_id, :price, :quantity)
    end
end
