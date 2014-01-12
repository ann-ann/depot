require 'spec_helper'

describe ProductAuthor do

  let(:product_author) { FactoryGirl.create(:product_author) }
  
  context "associations" do
    it { expect(product_author).to belong_to(:product) }
    it { expect(product_author).to belong_to(:author) }  
  end
end
