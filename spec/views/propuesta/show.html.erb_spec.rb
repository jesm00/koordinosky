require 'spec_helper'

describe "propuesta/show" do
  before(:each) do
    @propuestum = assign(:propuestum, stub_model(Propuestum))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
