require 'spec_helper'

describe "pensums/new" do
  before(:each) do
    assign(:pensum, stub_model(Pensum).as_new_record)
  end

  it "renders new pensum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pensums_path, "post" do
    end
  end
end
