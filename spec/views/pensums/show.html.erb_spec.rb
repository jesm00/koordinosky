require 'spec_helper'

describe "pensums/show" do
  before(:each) do
    @pensum = assign(:pensum, stub_model(Pensum))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
