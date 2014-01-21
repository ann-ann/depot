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
    it { expect(order).to have_one(:shipp_address).class_name('Address') }
    it { expect(order).to have_one(:bill_address).class_name('Address') }
  end

  context ".count_price" do
# TODO test this callback 
  end
  context ".add_product" do
  	it "add new item to order if there is no items with same product" do
  	  expect{ order.add_product(product) }.to change{ order.order_items.count }.to(1)
  	end
    it "increase quantity of product in item if product in order already" do
      order.add_product(product).save
      expect{ order.add_product(product).save }.to change{ order.order_items.first.quantity }.by(1)
    end

    it "decreases quantity of product" do
      order_with_items.add_product(product).save
      expect{ order_with_items.add_product(product).save }.to change{ product.in_stock }.by(-1)
    end
  end
  context ".set_status" do
    it { expect(order.state).to be_eql('new') }
  end
end

