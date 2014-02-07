class OrdersController < ApplicationController
  
  skip_before_filter :authorize, only: [:create, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = @current_customer.orders.completed.paginate page: params[:page], order: 'created_at desc', per_page: 10
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if @order.order_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end 
    begin
      @order = Order.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_path, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @order }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    session[:order_id] = nil

    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Your cart is empty now!' }
      format.json { head :ok }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit()
    end
end
