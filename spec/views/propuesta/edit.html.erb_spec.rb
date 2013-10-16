require 'spec_helper'

describe "propuesta/edit" do
  before(:each) do
    @propuestum = assign(:propuestum, stub_model(Propuestum))
  end

  it "renders the edit propuestum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", propuestum_path(@propuestum), "post" do
    end
  end
end
