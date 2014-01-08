class Order < ActiveRecord::Base
  # has_many :customer_orders
  # has_many :customers, through: :customer_orders
  has_many :order_items, dependent: :destroy
  belongs_to :customer
# TODO addresses! has_one :ship_address, class_name: "Address" + foreign_key OR single_table_inheritance

# TODO add method to set STATE and COMPLETED_AT  after created
  after_find :count_price

  after_validation :update_status, :set_completed_at
# TODO change type of completed_at in DB to 'datetime'


  def count_price
    self.total_price = OrderItem.where(order_id: self.id).sum("price")
  end

  def update_status
    self.state = 'new'
  end

  def set_completed_at
    self.completed_at = Date.today
  end

  def add_product(product) 
    current_item = order_items.find_by_product_id(product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.create(product_id: product.id)
    end
    product.in_stock-=1
    product.save

    current_item
  end

  def add_address(address_type)
  # TODO
  end



end
