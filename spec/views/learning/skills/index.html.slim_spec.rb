require 'rails_helper'

RSpec.describe "learning/skills/index", type: :view do
  before(:each) do
    assign(:learning_skills, [
      Learning::Skill.create!(
        body: "Body",
        description: "MyText"
      ),
      Learning::Skill.create!(
        body: "Body",
        description: "MyText"
      )
    ])
  end

  it "renders a list of learning/skills" do
    render
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
