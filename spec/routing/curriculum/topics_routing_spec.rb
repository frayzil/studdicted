require "rails_helper"

RSpec.describe Curriculum::TopicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/curriculum/topics").to route_to("curriculum/topics#index")
    end

    it "routes to #new" do
      expect(get: "/curriculum/topics/new").to route_to("curriculum/topics#new")
    end

    it "routes to #show" do
      expect(get: "/curriculum/topics/1").to route_to("curriculum/topics#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/curriculum/topics/1/edit").to route_to("curriculum/topics#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/curriculum/topics").to route_to("curriculum/topics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/curriculum/topics/1").to route_to("curriculum/topics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/curriculum/topics/1").to route_to("curriculum/topics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/curriculum/topics/1").to route_to("curriculum/topics#destroy", id: "1")
    end
  end
end
