require "rails_helper"

RSpec.describe Learning::SkillsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/learning/skills").to route_to("learning/skills#index")
    end

    it "routes to #new" do
      expect(get: "/learning/skills/new").to route_to("learning/skills#new")
    end

    it "routes to #show" do
      expect(get: "/learning/skills/1").to route_to("learning/skills#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/learning/skills/1/edit").to route_to("learning/skills#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/learning/skills").to route_to("learning/skills#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/learning/skills/1").to route_to("learning/skills#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/learning/skills/1").to route_to("learning/skills#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/learning/skills/1").to route_to("learning/skills#destroy", id: "1")
    end
  end
end
