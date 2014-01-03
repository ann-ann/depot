class Order < ActiveRecord::Base
  has_many :customer_orders
  has_many :customers, through: :customer_orders
  has_many :order_items, dependent: :destroy

  validates :ship_address, :bill_address, presence: :true

# TODO add method to set STATE and COMPLETED_AT  after created
  after_find :count_price

  after_validation :update_status
  after_save :set_completed_at

  def count_price
    self.total_price = order_items.to_a.sum { |item| item.price }
  end

  def update_status
    self.state = 'new'
  end

  def set_completed_at
    self.completed_at = Date.today
  end

  def add_product(product_id)
    current_item = order_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.build(product_id: product_id)
    end
    current_item
  end

  def add_address(address_type)
  # TODO
  end

end
