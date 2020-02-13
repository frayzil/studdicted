require 'rails_helper'

RSpec.describe "curriculum/boards/index", type: :view do
  before(:each) do
    assign(:curriculum_boards, [
      Curriculum::Board.create!(
        name: "Name"
      ),
      Curriculum::Board.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of curriculum/boards" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
