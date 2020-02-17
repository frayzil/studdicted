require 'rails_helper'

RSpec.describe "curriculum/topics/show", type: :view do
  before(:each) do
    @curriculum_topic = assign(:curriculum_topic, Curriculum::Topic.create!(
      title: "Title",
      type: "",
      description: "MyText",
      board: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
