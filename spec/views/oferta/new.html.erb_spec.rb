require 'spec_helper'

describe "oferta/new" do
  before(:each) do
    assign(:ofertum, stub_model(Ofertum,
      :cupos => 1
    ).as_new_record)
  end

  it "renders new ofertum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", oferta_path, "post" do
      assert_select "input#ofertum_cupos[name=?]", "ofertum[cupos]"
    end
  end
end
