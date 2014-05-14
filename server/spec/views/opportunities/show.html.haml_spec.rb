require 'spec_helper'

describe "opportunities/show" do
  before(:each) do
    @opportunity = assign(:opportunity, stub_model(Opportunity,
      :title => "Title",
      :description => "MyText",
      :number_of_positions => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
