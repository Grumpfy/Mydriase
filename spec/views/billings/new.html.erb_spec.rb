require 'spec_helper'

describe "billings/new" do
  before(:each) do
    assign(:billing, stub_model(Billing,
      :price => "9.99",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new billing form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => billings_path, :method => "post" do
      assert_select "input#billing_price", :name => "billing[price]"
      assert_select "textarea#billing_description", :name => "billing[description]"
    end
  end
end
