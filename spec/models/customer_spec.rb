require 'spec_helper'

describe Customer do
  let(:customer) { FactoryGirl.create(:customer) }

  context "validations" do
    it { expect(customer).to validate_presence_of(:email) }
    it { expect(customer).to validate_presence_of(:first_name) }
    it { expect(customer).to validate_presence_of(:last_name) }
    it { expect(customer).to validate_presence_of(:password) }
    it { expect(customer).to validate_uniqueness_of(:email) }
    it { expect(customer).to allow_value("ann@email.com o_o.@ll.cc").for(:email) }
    it { expect(customer).to_not allow_value("ann@emailcom o_o.ll.cc").for(:email) }
  end

  context "associations" do
    it { expect(customer).to have_many(:ratings) }
    it { expect(customer).to have_many(:orders) }
  end
end
