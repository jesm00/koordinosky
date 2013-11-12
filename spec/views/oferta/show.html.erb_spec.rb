require 'spec_helper'

describe "oferta/show" do
  before(:each) do
    @ofertum = assign(:ofertum, stub_model(Ofertum,
      :cupos => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
