class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :customer_orders
  has_many :customers, through: :customer_orders
end
