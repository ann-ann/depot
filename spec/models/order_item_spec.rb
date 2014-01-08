require 'spec_helper'

describe OrderItem do
    
  let(:order_item) { FactoryGirl.create(:order_item, product: product) }
  let(:product) { FactoryGirl.create(:product) }

  context "validations" do
    it { expect(order_item).to validate_numericality_of(:price)}
    it { expect(order_item).to validate_numericality_of(:quantity)}
  end
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

  context ".back_product_to_stock" do
    it "called before destroy" do
      expect(order_item).to receive(:back_product_to_stock)
      order_item.destroy
    end
  
    it "increase product quantity if item deleted" do
     expect { order_item.destroy }.to change{product.in_stock}.by(order_item.quantity)
    end
  end

  context ".decrease_quantity" do
    it { expect { order_item.decrease_quantity }.to change{product.in_stock}.by(1) }
  end
end
