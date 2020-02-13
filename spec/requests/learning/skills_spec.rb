require 'rails_helper'

RSpec.describe "Learning::Skills", type: :request do
  describe "GET /learning/skills" do
    it "works! (now write some real specs)" do
      get learning_skills_path
      expect(response).to have_http_status(200)
    end
  end
end
