require 'rails_helper'

RSpec.describe "learning/skills/new", type: :view do
  before(:each) do
    assign(:learning_skill, Learning::Skill.new(
      body: "MyString",
      description: "MyText"
    ))
  end

  it "renders new learning_skill form" do
    render

    assert_select "form[action=?][method=?]", learning_skills_path, "post" do

      assert_select "input[name=?]", "learning_skill[body]"

      assert_select "textarea[name=?]", "learning_skill[description]"
    end
  end
end
