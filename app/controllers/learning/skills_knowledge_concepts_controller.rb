class Learning::SkillsKnowledgeConceptsController < ApplicationController

  def destroy
    Learning::SkillsKnowledgeConcept.find(params[:id]).destroy
    redirect_back fallback_location: root_path, notice: 'Skill was successfully removed.'
  end
end
