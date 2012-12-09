require 'spec_helper'

describe "operations/show" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :price => "9.99",
      :method => "Method",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/Method/)
    rendered.should match(/MyText/)
  end
end
