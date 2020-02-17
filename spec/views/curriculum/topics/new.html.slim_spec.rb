require 'rails_helper'

RSpec.describe "curriculum/topics/new", type: :view do
  before(:each) do
    assign(:curriculum_topic, Curriculum::Topic.new(
      title: "MyString",
      type: "",
      description: "MyText",
      board: nil
    ))
  end

  it "renders new curriculum_topic form" do
    render

    assert_select "form[action=?][method=?]", curriculum_topics_path, "post" do

      assert_select "input[name=?]", "curriculum_topic[title]"

      assert_select "input[name=?]", "curriculum_topic[type]"

      assert_select "textarea[name=?]", "curriculum_topic[description]"

      assert_select "input[name=?]", "curriculum_topic[board_id]"
    end
  end
end
