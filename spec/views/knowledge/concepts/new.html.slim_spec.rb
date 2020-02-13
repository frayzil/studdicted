require 'rails_helper'

RSpec.describe "knowledge/concepts/new", type: :view do
  before(:each) do
    assign(:knowledge_concept, Knowledge::Concept.new(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new knowledge_concept form" do
    render

    assert_select "form[action=?][method=?]", knowledge_concepts_path, "post" do

      assert_select "input[name=?]", "knowledge_concept[title]"

      assert_select "textarea[name=?]", "knowledge_concept[description]"
    end
  end
end
