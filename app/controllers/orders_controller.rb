class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
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

  # GET /orders/new
  def new
    @order = current_order
    if @order.order_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end

  end

  # GET /orders/1/edit
  def edit
     @order = current_order
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.ship_address = Adderess.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = current_order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = current_order
    @order.destroy
    session[:order_id] = nil

    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Your cart is empty now!' }
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_order
    #   @order = Order.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:bill_address, :ship_address, :state, :created_at)
    end
end
