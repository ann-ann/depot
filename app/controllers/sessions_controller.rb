class SessionsController < ApplicationController
  skip_before_filter :authorize_admin
  skip_before_filter :authorize
  def new
  end

  def create
    customer = Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      flash.now.alert = "Logged in! #{session[:customer_id]}"
      if customer.admin?
        redirect_to '/admin'
      else
         # TODO fix duplication in sessions controller
        @order = current_order
        @order.set_customer(customer)

        redirect_to store_url, :notice => "Logged in!"
      end
    else
      redirect_to store_url, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to store_url, :notice => "Logged out!"
  end
end