require 'spec_helper'

describe "propuesta/index" do
  before(:each) do
    assign(:propuesta, [
      stub_model(Propuestum),
      stub_model(Propuestum)
    ])
  end

  it "renders a list of propuesta" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
