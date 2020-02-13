require "rails_helper"

RSpec.describe Curriculum::BoardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/curriculum/boards").to route_to("curriculum/boards#index")
    end

    it "routes to #new" do
      expect(get: "/curriculum/boards/new").to route_to("curriculum/boards#new")
    end

    it "routes to #show" do
      expect(get: "/curriculum/boards/1").to route_to("curriculum/boards#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/curriculum/boards/1/edit").to route_to("curriculum/boards#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/curriculum/boards").to route_to("curriculum/boards#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/curriculum/boards/1").to route_to("curriculum/boards#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/curriculum/boards/1").to route_to("curriculum/boards#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/curriculum/boards/1").to route_to("curriculum/boards#destroy", id: "1")
    end
  end
end
