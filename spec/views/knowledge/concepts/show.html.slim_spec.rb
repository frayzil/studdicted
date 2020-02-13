require 'rails_helper'

RSpec.describe "knowledge/concepts/show", type: :view do
  before(:each) do
    @knowledge_concept = assign(:knowledge_concept, Knowledge::Concept.create!(
      title: "Title",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
