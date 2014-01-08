require 'spec_helper'

describe Order do
  let(:order) { FactoryGirl.create :order}
  # let(:order_item) { FactoryGirl.create :order_item}
  let(:product) { FactoryGirl.create :product}

  context "validations" do
    # it { expect(order).to validate_presence_of(:ship_address) }

    # it { expect(order).to validate_presence_of(:bill_address) }
  end

  context "assosiations" do
  	# TODO check dependent destroy
    it { expect(order).to have_many(:order_items) }
  end

  context "adds products to the order" do

  	it "adds items to order" do
  	  expect{ order.add_product(product) }.to change{ order.order_items.count }.to(1)

  	end

  end
# TODO count_price test
end

