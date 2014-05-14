require 'spec_helper'

describe "opportunities/new" do
  before(:each) do
    assign(:opportunity, stub_model(Opportunity,
      :title => "MyString",
      :description => "MyText",
      :number_of_positions => 1
    ).as_new_record)
  end

  it "renders new opportunity form" do
    render

    assert_select "form[action=?][method=?]", opportunities_path, "post" do
      assert_select "input#opportunity_title[name=?]", "opportunity[title]"
      assert_select "textarea#opportunity_description[name=?]", "opportunity[description]"
      assert_select "input#opportunity_number_of_positions[name=?]", "opportunity[number_of_positions]"
    end
  end
end
