class Learning::SkillsKnowledgeConceptsController < ApplicationController
  
  def new
    @skill = Learning::Skill.find params[:skill_id]
    @skills_knowledge_concept = @skill.skills_knowledge_concepts.new
  end

  def create
    @skill = Learning::Skill.find params[:skill_id]

    @skills_knowledge_concept = @skill.skills_knowledge_concepts.new(skills_knowledge_concept_params)

    respond_to do |format|
      if @skills_knowledge_concept.save
        format.html {
          redirect_to learning_skill_knowledge_concepts_path(@skill),
          notice: 'Skill was successfully created.'
        }
        format.json { render :show, status: :created, location: @skills_knowledge_concept }
      else
        format.html { render :new }
        format.json { render json: @skills_knowledge_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @skill = Learning::Skill.find params[:skill_id]
    @skills_knowledge_concepts = @skill.skills_knowledge_concepts
  end

  def destroy
    Learning::SkillsKnowledgeConcept.find(params[:id]).destroy
    redirect_back fallback_location: root_path, notice: 'Skill was successfully removed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def skills_knowledge_concept_params
    params.require(:learning_skills_knowledge_concept).permit(:knowledge_concept_title)
  end
end
