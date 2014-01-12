require 'spec_helper'

describe Type do

  let(:type) { FactoryGirl.create :type }	
  it { expect(type).to validate_presence_of(:name) }
  it { expect(type).to validate_uniqueness_of(:name) }
  it { expect(type).to have_many(:product_types) }
  it { expect(type).to have_many(:products).through(:product_types) }

end
