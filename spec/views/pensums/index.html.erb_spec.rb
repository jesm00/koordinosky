require 'spec_helper'

describe "pensums/index" do
  before(:each) do
    assign(:pensums, [
      stub_model(Pensum),
      stub_model(Pensum)
    ])
  end

  it "renders a list of pensums" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
