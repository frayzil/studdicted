require "rails_helper"

RSpec.describe Knowledge::ConceptsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/knowledge/concepts").to route_to("knowledge/concepts#index")
    end

    it "routes to #new" do
      expect(get: "/knowledge/concepts/new").to route_to("knowledge/concepts#new")
    end

    it "routes to #show" do
      expect(get: "/knowledge/concepts/1").to route_to("knowledge/concepts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/knowledge/concepts/1/edit").to route_to("knowledge/concepts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/knowledge/concepts").to route_to("knowledge/concepts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/knowledge/concepts/1").to route_to("knowledge/concepts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/knowledge/concepts/1").to route_to("knowledge/concepts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/knowledge/concepts/1").to route_to("knowledge/concepts#destroy", id: "1")
    end
  end
end
