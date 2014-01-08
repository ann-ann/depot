require 'spec_helper'

describe Order do
  let(:order) { FactoryGirl.create :order}
  let(:product) { FactoryGirl.create :product}
  let(:order_with_items) { FactoryGirl.create :order_with_items}

  context "validations" do
    # it { expect(order).to ensure_inclusion_of(:state).in_array(%w(in_progress complited shipped)) }
  end

  context "assosiations" do
    it { expect(order).to have_many(:order_items).dependent(:destroy) }
    it { expect(order).to belong_to(:customer) }
    it { expect(order).to have_one(:ship_address).class_name('Address') }
    it { expect(order).to have_one(:bill_address).class_name('Address') }
  end

  it "count total price after order updated" do
# TODO test this callback 
  end
  context "adds products to the order" do

  	it "adds items to order" do
  	  expect{ order.add_product(product) }.to change{ order.order_items.count }.to(1)

  	end

  end
# TODO count_price test
end

