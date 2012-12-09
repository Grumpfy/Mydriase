require 'spec_helper'

describe "operations/edit" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :price => "9.99",
      :method => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operations_path(@operation), :method => "post" do
      assert_select "input#operation_price", :name => "operation[price]"
      assert_select "input#operation_method", :name => "operation[method]"
      assert_select "textarea#operation_description", :name => "operation[description]"
    end
  end
end
