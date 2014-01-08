require 'spec_helper'

describe OrderItem do
    
  let(:order_item) { FactoryGirl.create(:order_item) }

  context "associations" do
    it { expect(order_item).to belong_to(:product)}
    it { expect(order_item).to belong_to(:order)}  
  end

  context ".count_price" do
    it "called before save" do
      expect(order_item).to receive(:count_price)
      order_item.save
    end
    
  end
end
