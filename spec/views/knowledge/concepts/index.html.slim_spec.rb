require 'rails_helper'

RSpec.describe "knowledge/concepts/index", type: :view do
  before(:each) do
    assign(:knowledge_concepts, [
      Knowledge::Concept.create!(
        title: "Title",
        description: "MyText"
      ),
      Knowledge::Concept.create!(
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of knowledge/concepts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
