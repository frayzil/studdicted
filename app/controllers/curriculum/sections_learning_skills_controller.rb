class Curriculum::SectionsLearningSkillsController < ApplicationController
  
  def new
    @section = Curriculum::Section.find params[:section_id]
    @sections_learning_skill = @section.sections_learning_skills.new
  end

  def create
    @section = Curriculum::Section.find params[:section_id]

    @sections_learning_skill = @section.sections_learning_skills.new(sections_learning_skill_params)

    respond_to do |format|
      if @sections_learning_skill.save
        format.html {
          redirect_to curriculum_section_learning_skills_path(@section),
          notice: 'Skill was successfully added.'
        }
        format.json { render :show, status: :created, location: @sections_learning_skill }
      else
        format.html { render :new }
        format.json { render json: @sections_learning_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @section = Curriculum::Section.find params[:section_id]
    @sections_learning_skills = @section.sections_learning_skills
  end

  def destroy
    Curriculum::SectionsLearningSkill.find(params[:id]).destroy
    redirect_back fallback_location: root_path, notice: 'Skill was successfully removed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def sections_learning_skill_params
    params.require(:curriculum_sections_learning_skill).permit(:learning_skill_body)
  end
end
