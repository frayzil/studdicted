class Learning::SkillsKnowledgeConceptsController < ApplicationController

  # DELETE /learning/skills/1
  # DELETE /learning/skills/1.json
  def destroy
    Learning::SkillsKnowledgeConcept.find(params[:id]).destroy
    redirect_back fallback_location: root_path, notice: 'Skill was successfully removed.'
  end
end
