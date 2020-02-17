require 'rails_helper'

RSpec.describe "curriculum/topics/index", type: :view do
  before(:each) do
    assign(:curriculum_topics, [
      Curriculum::Topic.create!(
        title: "Title",
        type: "",
        description: "MyText",
        board: nil
      ),
      Curriculum::Topic.create!(
        title: "Title",
        type: "",
        description: "MyText",
        board: nil
      )
    ])
  end

  it "renders a list of curriculum/topics" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
