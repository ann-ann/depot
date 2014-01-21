class Order < ActiveRecord::Base

  # validates_inclusion_of :state, in: %w(in_progress complited shipped), allow_blank: true

  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_one :shipp_address, class_name: "Address"
  has_one :bill_address, class_name: "Address"
# TODO update after order_item added
  after_find :count_price
  before_create :set_status, :set_completed_at

  scope :_new, -> {where("state = 'new'")}

  def count_price
    self.total_price = OrderItem.where(order_id: self.id).sum("price")
  end

  def set_status
    self.state = 'new'
  end

  def set_completed_at
    self.completed_at = Date.today
  end

  def set_customer(customer)
    self.customer_id = customer.id if customer
    save
  end

  def add_product(product) 
    current_item = order_items.find_by_product_id(product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = order_items.create(product_id: product.id)
    end
    # TODO move to callbacks of OrderItem
    product.in_stock-=1
    product.save

    current_item
  end
end

