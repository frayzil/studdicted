require 'rails_helper'

RSpec.describe "knowledge/concepts/edit", type: :view do
  before(:each) do
    @knowledge_concept = assign(:knowledge_concept, Knowledge::Concept.create!(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit knowledge_concept form" do
    render

    assert_select "form[action=?][method=?]", knowledge_concept_path(@knowledge_concept), "post" do

      assert_select "input[name=?]", "knowledge_concept[title]"

      assert_select "textarea[name=?]", "knowledge_concept[description]"
    end
  end
end
