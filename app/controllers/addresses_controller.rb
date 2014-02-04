class AddressesController < ApplicationController
  skip_before_filter :authorize_admin
  before_action :set_order

  def set_order
    @order = current_order
  end

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
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        @order = current_order
        @order.add_address(@address)
        @order.complete_order
        OrderNotifier.received(@order).deliver

        format.html { redirect_to store_url, notice: "Thank you for your order" }
        format.json { render json: @address, status: :created, location: @address }
        
        session[:order_id] = nil
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
    def address_params
      params.require(:address).permit(:city, :address, :phone, :zipcode)
    end
end
