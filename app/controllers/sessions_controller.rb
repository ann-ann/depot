class SessionsController < ApplicationController

  skip_before_filter :authorize

  def create
    customer = Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      if customer.admin?
        redirect_to '/admin'
      else
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