require 'spec_helper'

describe "operations/index" do
  before(:each) do
    assign(:operations, [
      stub_model(Operation,
        :price => "9.99",
        :method => "Method",
        :description => "MyText"
      ),
      stub_model(Operation,
        :price => "9.99",
        :method => "Method",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of operations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Method".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
