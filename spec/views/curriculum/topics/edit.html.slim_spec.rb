require 'rails_helper'

RSpec.describe "curriculum/topics/edit", type: :view do
  before(:each) do
    @curriculum_topic = assign(:curriculum_topic, Curriculum::Topic.create!(
      title: "MyString",
      type: "",
      description: "MyText",
      board: nil
    ))
  end

  it "renders the edit curriculum_topic form" do
    render

    assert_select "form[action=?][method=?]", curriculum_topic_path(@curriculum_topic), "post" do

      assert_select "input[name=?]", "curriculum_topic[title]"

      assert_select "input[name=?]", "curriculum_topic[type]"

      assert_select "textarea[name=?]", "curriculum_topic[description]"

      assert_select "input[name=?]", "curriculum_topic[board_id]"
    end
  end
end
