require 'rails_helper'

RSpec.describe "learning/skills/show", type: :view do
  before(:each) do
    @learning_skill = assign(:learning_skill, Learning::Skill.create!(
      body: "Body",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/MyText/)
  end
end
