require 'rails_helper'

RSpec.describe "DataUploads", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/data_uploads/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create:post" do
    it "returns http success" do
      get "/data_uploads/create:post"
      expect(response).to have_http_status(:success)
    end
  end

end
