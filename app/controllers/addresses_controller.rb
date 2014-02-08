class AddressesController < ApplicationController
  # before_action :set_order

  # def set_order
  #   @order = current_order
  # end

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
        @order.add_address(@address)
        @order.complete_order(@current_customer)

        format.html { redirect_to store_url, notice: "Thank you for your order" }
        format.json { render json: @address, status: :created, location: @address }
        
        session[:order_id] = nil
      else
        format.html { render action: 'new' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end

  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:city, :address, :phone, :zipcode)
    end
end
