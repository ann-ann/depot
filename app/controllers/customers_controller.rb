class CustomersController < ApplicationController

  skip_before_filter :authorize, only: [:new, :create]

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @order = current_order
    if @order.order_items.empty?
      redirect_to store_url, notice: "Your cart is empty.customer"
      return
    end

    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create

    @customer = Customer.new(customer_params)
    @customer.set_user_role

    respond_to do |format|
      if @customer.save

        session[:customer_id] = @customer.id
        # TODO fix duplication in sessions controller
        @order = current_order
        @order.set_customer(@customer)

        format.html { redirect_to @order}
        format.json { render json: @customer, status: :created,
          location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :ok }
    end
  end

   def customer_params
      params.require(:customer).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
end