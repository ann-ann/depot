require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :total_price => "",
        :state => "State",
        :completed_at => "Completed At",
        :bill_address => "Bill Address",
        :ship_address => "Ship Address"
      ),
      stub_model(Order,
        :total_price => "",
        :state => "State",
        :completed_at => "Completed At",
        :bill_address => "Bill Address",
        :ship_address => "Ship Address"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Completed At".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Address".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Address".to_s, :count => 2
  end
end
