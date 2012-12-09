require 'spec_helper'

describe "billings/show" do
  before(:each) do
    @billing = assign(:billing, stub_model(Billing,
      :price => "9.99",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/MyText/)
  end
end
