class Order < ActiveRecord::Base

  # validates_inclusion_of :state, in: %w(in_progress complited shipped), allow_blank: true

  has_many :order_items, dependent: :destroy
  belongs_to :customer
  belongs_to :shipp_address, class_name: "Address"
  belongs_to :bill_address, class_name: "Address"
# TODO update after order_item added
  after_find :count_price
  before_create :set_status

  # accepts_nested_attributes_for :shipp_address, :bill_address

  scope :_new, -> {where("state = 'new'")}
  scope :complited, -> {where("state = 'complited'")}

  def count_price
    self.total_price = OrderItem.where(order_id: self.id).sum("price")
  end

  def set_status
    self.state = 'new'
  end
   
  def complete_order
    self.completed_at = Date.today
    self.state = "complited"
    save
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

  def add_address(address)
    self.bill_address = address
    self.shipp_address = address
    save
  end

end

