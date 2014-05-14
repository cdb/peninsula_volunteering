require 'spec_helper'

describe "opportunities/edit" do
  before(:each) do
    @opportunity = assign(:opportunity, stub_model(Opportunity,
      :title => "MyString",
      :description => "MyText",
      :number_of_positions => 1
    ))
  end

  it "renders the edit opportunity form" do
    render

    assert_select "form[action=?][method=?]", opportunity_path(@opportunity), "post" do
      assert_select "input#opportunity_title[name=?]", "opportunity[title]"
      assert_select "textarea#opportunity_description[name=?]", "opportunity[description]"
      assert_select "input#opportunity_number_of_positions[name=?]", "opportunity[number_of_positions]"
    end
  end
end
