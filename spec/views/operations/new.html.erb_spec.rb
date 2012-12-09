require 'spec_helper'

describe "operations/new" do
  before(:each) do
    assign(:operation, stub_model(Operation,
      :price => "9.99",
      :method => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operations_path, :method => "post" do
      assert_select "input#operation_price", :name => "operation[price]"
      assert_select "input#operation_method", :name => "operation[method]"
      assert_select "textarea#operation_description", :name => "operation[description]"
    end
  end
end
