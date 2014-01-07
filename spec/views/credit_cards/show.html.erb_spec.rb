require 'spec_helper'

describe "credit_cards/show" do
  before(:each) do
    @credit_card = assign(:credit_card, stub_model(CreditCard,
      :number => "9.99",
      :cvv => 1,
      :exp_m => 2,
      :exp_y => 3,
      :fname => "Fname",
      :lname => "Lname",
      :customer => nil,
      :order => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Fname/)
    rendered.should match(/Lname/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
