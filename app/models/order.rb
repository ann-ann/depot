class Order < ActiveRecord::Base
  # has_many :customer_orders
  # has_many :customers, through: :customer_orders
  has_many :order_items, dependent: :destroy
  belongs_to :customer
# TODO addresses! has_one :ship_address, class_name: "Address" + foreign_key OR single_table_inheritance

  # validates :ship_address, :bill_address, presence: :true . will be validated later

# TODO add method to set STATE and COMPLETED_AT  after created
  after_find :count_price

  after_validation :update_status, :set_completed_at
# TODO change type of completed_at in DB to 'datetime'


  def count_price
    # TODO refactor through DB (ActiveREcord) - sum

    self.total_price = order_items.to_a.sum { |item| item.price }
  end

  def update_status
    self.state = 'new'
  end

  def set_completed_at
    self.completed_at = Date.today
  end

  def add_product(product_id)
    # TODO product_id to Product object  
    current_item = order_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.create(product_id: product_id)
    end
    current_item
  end

  def add_address(address_type)
  # TODO
  end



end
