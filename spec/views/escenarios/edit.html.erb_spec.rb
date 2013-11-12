require 'spec_helper'

describe "escenarios/edit" do
  before(:each) do
    @escenario = assign(:escenario, stub_model(Escenario,
      :nombre => "MyString"
    ))
  end

  it "renders the edit escenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", escenario_path(@escenario), "post" do
      assert_select "input#escenario_nombre[name=?]", "escenario[nombre]"
    end
  end
end
