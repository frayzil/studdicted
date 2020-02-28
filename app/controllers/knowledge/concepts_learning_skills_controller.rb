# frozen_string_literal: true

class Knowledge::ConceptsLearningSkillsController < ApplicationController
  def new
    @concept = Knowledge::Concept.find params[:concept_id]
    @concepts_learning_skill = @concept.concepts_learning_skills.new
  end

  def create
    @concept = Knowledge::Concept.find params[:concept_id]

    @concepts_learning_skill = @concept.concepts_learning_skills.new(concepts_learning_skill_params)

    respond_to do |format|
      if @concepts_learning_skill.save
        format.html {
          redirect_to knowledge_concept_skills_path(@concept),
          notice: 'Skill was successfully created.'
        }
        format.json { render :show, status: :created, location: @concepts_learning_skill }
      else
        format.html { render :new }
        format.json { render json: @concepts_learning_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @concept = Knowledge::Concept.find params[:concept_id]
    @concepts_learning_skills = @concept.concepts_learning_skills
  end

  private

  # Only allow a list of trusted parameters through.
  def concepts_learning_skill_params
    params.require(:learning_skills_knowledge_concept).permit(:skill_body)
  end
end
