require 'spec_helper'

describe "propuesta/new" do
  before(:each) do
    assign(:propuestum, stub_model(Propuestum).as_new_record)
  end

  it "renders new propuestum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", propuesta_path, "post" do
    end
  end
end
