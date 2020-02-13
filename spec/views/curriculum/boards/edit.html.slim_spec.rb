require 'rails_helper'

RSpec.describe "curriculum/boards/edit", type: :view do
  before(:each) do
    @curriculum_board = assign(:curriculum_board, Curriculum::Board.create!(
      name: "MyString"
    ))
  end

  it "renders the edit curriculum_board form" do
    render

    assert_select "form[action=?][method=?]", curriculum_board_path(@curriculum_board), "post" do

      assert_select "input[name=?]", "curriculum_board[name]"
    end
  end
end
