require 'rails_helper'

RSpec.describe "curriculum/boards/new", type: :view do
  before(:each) do
    assign(:curriculum_board, Curriculum::Board.new(
      name: "MyString"
    ))
  end

  it "renders new curriculum_board form" do
    render

    assert_select "form[action=?][method=?]", curriculum_boards_path, "post" do

      assert_select "input[name=?]", "curriculum_board[name]"
    end
  end
end
