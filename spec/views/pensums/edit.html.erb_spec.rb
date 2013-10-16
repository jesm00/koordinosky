require 'spec_helper'

describe "pensums/edit" do
  before(:each) do
    @pensum = assign(:pensum, stub_model(Pensum))
  end

  it "renders the edit pensum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pensum_path(@pensum), "post" do
    end
  end
end
