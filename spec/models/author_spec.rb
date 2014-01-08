require 'spec_helper'

describe Author do
  
  let(:author) { FactoryGirl.create :author}

  it { expect(author).to validate_presence_of(:first_name) }
  it { expect(author).to validate_presence_of(:last_name) }
  it { expect(author).to have_many(:product_authors) }
  it { expect(author).to have_many(:products) }
# Need to test simple to_s method?
end
