require 'active_support/core_ext/object/blank'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_customer, :current_order
  before_filter :authorize_admin

  protected
  def authorize_admin
    unless @current_customer && @current_customer.admin?
      redirect_to store_path, notice: "Youre not allowed to be there. sorry :("
    end
  end

  private
  def current_order
    # имеет ли смысл фильтровать по юзеру ? see below
    # @order.in? @current_customer.orders
    @order = Order.find(session[:order_id]) 
    rescue ActiveRecord::RecordNotFound
    @order = Order.create
    session[:order_id] = @order.id
    @order.set_customer(current_customer)
  end
  
  def current_customer
    @current_customer ||= session[:customer_id] &&
    Customer.find_by(id: session[:customer_id])
  end

end
