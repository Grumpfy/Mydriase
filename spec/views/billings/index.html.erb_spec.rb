require 'spec_helper'

describe "billings/index" do
  before(:each) do
    assign(:billings, [
      stub_model(Billing,
        :price => "9.99",
        :description => "MyText"
      ),
      stub_model(Billing,
        :price => "9.99",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of billings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
