class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      flash.now.alert = "Logged in! #{session[:customer_id]}"
      redirect_to store_url, :notice => "Logged in!"
    else
      redirect_to store_url, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to store_url, :notice => "Logged out!"
  end
end