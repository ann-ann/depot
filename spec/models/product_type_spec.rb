require 'spec_helper'

describe ProductType do
  
  let(:product_type) { FactoryGirl.create(:product_type) }
   context "associations" do
     it {expect(product_type).to belong_to(:product) }
     it {expect(product_type).to belong_to(:type) }
   end
end
