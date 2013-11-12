require 'spec_helper'

describe "escenarios/index" do
  before(:each) do
    assign(:escenarios, [
      stub_model(Escenario,
        :nombre => "Nombre"
      ),
      stub_model(Escenario,
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of escenarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
