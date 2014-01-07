require 'spec_helper'

describe Address do

	let(:address) {FactoryGirl.create :address}

	context "validates presence of all attributes" do
      it { expect(address).to validate_presence_of(:address) }
      it { expect(address).to validate_presence_of(:zipcode) }
      it { expect(address).to validate_presence_of(:phone) }
      it { expect(address).to validate_presence_of(:city) }
	end

	context " belongs to country and order" do
      it { expect(address).to belong_to(:country)}
      it { expect(address).to belong_to(:order)}
	end
 
end
