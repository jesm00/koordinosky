require 'spec_helper'

describe "escenarios/show" do
  before(:each) do
    @escenario = assign(:escenario, stub_model(Escenario,
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
  end
end
