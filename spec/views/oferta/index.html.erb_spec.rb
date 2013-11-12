require 'spec_helper'

describe "oferta/index" do
  before(:each) do
    assign(:oferta, [
      stub_model(Ofertum,
        :cupos => 1
      ),
      stub_model(Ofertum,
        :cupos => 1
      )
    ])
  end

  it "renders a list of oferta" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
