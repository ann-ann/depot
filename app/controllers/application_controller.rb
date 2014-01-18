class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
# TODO fix.find order in DB by user
  def current_order
    Order.find(session[:order_id]) 
    rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end
  
 def current_customer
  @current_customer ||= session[:customer_id] &&
  Customer.find_by(id: session[:customer_id])
  end

end
