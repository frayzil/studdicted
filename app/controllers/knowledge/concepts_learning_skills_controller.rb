class Knowledge::ConceptsLearningSkillsController < ApplicationController

  # GET /learning/skills
  # GET /learning/skills.json
  def index
    @concept = Knowledge::Concept.find params[:concept_id]
    @concepts_learning_skills = @concept.concepts_learning_skills
  end
end
