require 'active_support/core_ext/object/try.rb'

class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders

  has_secure_password

  validates :email, :first_name, :last_name, :password_digest, presence: :true
  validates :email, uniqueness: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates_inclusion_of :role, in: %w(admin user)

  def name
    first_name + " " + last_name
  end

  def admin?
    true if role.eql? "admin"
  end

  def rate(product)
  	products = []
    orders.each do |o|
      o.order_items.each do |oi|
        products << oi.product_id
      end
    end
    ratings = Rating.where("customer_id = #{self.id} AND product_id = #{product.id}")
# try instead on unless not
    unless ratings.empty?
     ratings.each do |r| 
       products.delete(r.product_id) if products.include? r.product_id
     end
    end
    puts "#{ratings}"
    # list of products that can be rated 
    products

    if products.include? product.id
# create new rating
      true
    else
# return error
     false
    end
  end 
end
