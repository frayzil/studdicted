require 'rails_helper'

RSpec.describe "curriculum/boards/show", type: :view do
  before(:each) do
    @curriculum_board = assign(:curriculum_board, Curriculum::Board.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
