require 'rails_helper'

RSpec.describe "Curriculum::Boards", type: :request do
  describe "GET /curriculum/boards" do
    it "works! (now write some real specs)" do
      get curriculum_boards_path
      expect(response).to have_http_status(200)
    end
  end
end
