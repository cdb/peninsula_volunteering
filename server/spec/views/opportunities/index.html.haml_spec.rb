require 'spec_helper'

describe "opportunities/index" do
  before(:each) do
    assign(:opportunities, [
      stub_model(Opportunity,
        :title => "Title",
        :description => "MyText",
        :number_of_positions => 1
      ),
      stub_model(Opportunity,
        :title => "Title",
        :description => "MyText",
        :number_of_positions => 1
      )
    ])
  end

  it "renders a list of opportunities" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
