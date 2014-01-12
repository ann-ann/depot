class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders

  validates :email, :first_name, :last_name, :password, presence: :true
  validates :email, uniqueness: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  def rate(product)
  	products = []
    orders.each do |o|
      o.order_items.each do |oi|
        products << oi.product_id
      end
    end
    ratings = Rating.where("customer_id = #{self.id} AND product_id = #{product.id}")

    unless ratings.nil?
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
