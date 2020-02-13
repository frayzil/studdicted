require 'rails_helper'

RSpec.describe "learning/skills/edit", type: :view do
  before(:each) do
    @learning_skill = assign(:learning_skill, Learning::Skill.create!(
      body: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit learning_skill form" do
    render

    assert_select "form[action=?][method=?]", learning_skill_path(@learning_skill), "post" do

      assert_select "input[name=?]", "learning_skill[body]"

      assert_select "textarea[name=?]", "learning_skill[description]"
    end
  end
end
