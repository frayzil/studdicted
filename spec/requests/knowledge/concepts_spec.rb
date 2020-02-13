require 'rails_helper'

RSpec.describe "Knowledge::Concepts", type: :request do
  describe "GET /knowledge/concepts" do
    it "works! (now write some real specs)" do
      get knowledge_concepts_path
      expect(response).to have_http_status(200)
    end
  end
end
