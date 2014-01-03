require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :total_price => "",
      :state => "MyString",
      :completed_at => "MyString",
      :bill_address => "MyString",
      :ship_address => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_total_price[name=?]", "order[total_price]"
      assert_select "input#order_state[name=?]", "order[state]"
      assert_select "input#order_completed_at[name=?]", "order[completed_at]"
      assert_select "input#order_bill_address[name=?]", "order[bill_address]"
      assert_select "input#order_ship_address[name=?]", "order[ship_address]"
    end
  end
end
