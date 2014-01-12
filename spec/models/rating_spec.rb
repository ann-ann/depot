require 'spec_helper'

describe Rating do
    
  let(:rating) { FactoryGirl.create(:rating) }

	context "validations" do
      it { expect(rating).to validate_presence_of(:rating) }
      it { expect(rating).to validate_numericality_of(:rating).only_integer }
      it {expect(rating).to ensure_inclusion_of(:rating).in_range(1..10)}
	end
    context "associations" do
      it { expect(rating).to belong_to(:customer) }
      it { expect(rating).to belong_to(:product) }
    end
end
