require 'spec_helper'

describe "escenarios/new" do
  before(:each) do
    assign(:escenario, stub_model(Escenario,
      :nombre => "MyString"
    ).as_new_record)
  end

  it "renders new escenario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", escenarios_path, "post" do
      assert_select "input#escenario_nombre[name=?]", "escenario[nombre]"
    end
  end
end
