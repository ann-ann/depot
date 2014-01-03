require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :total_price => "",
      :state => "State",
      :completed_at => "Completed At",
      :bill_address => "Bill Address",
      :ship_address => "Ship Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/State/)
    rendered.should match(/Completed At/)
    rendered.should match(/Bill Address/)
    rendered.should match(/Ship Address/)
  end
end
