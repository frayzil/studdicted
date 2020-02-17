require 'rails_helper'

RSpec.describe "Curriculum::Topics", type: :request do
  describe "GET /curriculum/topics" do
    it "works! (now write some real specs)" do
      get curriculum_topics_path
      expect(response).to have_http_status(200)
    end
  end
end
