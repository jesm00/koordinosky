require 'spec_helper'

describe "oferta/edit" do
  before(:each) do
    @ofertum = assign(:ofertum, stub_model(Ofertum,
      :cupos => 1
    ))
  end

  it "renders the edit ofertum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ofertum_path(@ofertum), "post" do
      assert_select "input#ofertum_cupos[name=?]", "ofertum[cupos]"
    end
  end
end
