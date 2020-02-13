class Learning::SkillsController < ApplicationController
  before_action :set_learning_skill, only: [:show, :edit, :update, :destroy]

  # GET /learning/skills
  # GET /learning/skills.json
  def index
    @learning_skills = Learning::Skill.all
  end

  # GET /learning/skills/1
  # GET /learning/skills/1.json
  def show
  end

  # GET /learning/skills/new
  def new
    @learning_skill = Learning::Skill.new
  end

  # GET /learning/skills/1/edit
  def edit
  end

  # POST /learning/skills
  # POST /learning/skills.json
  def create
    @learning_skill = Learning::Skill.new(learning_skill_params)

    respond_to do |format|
      if @learning_skill.save
        format.html { redirect_to @learning_skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @learning_skill }
      else
        format.html { render :new }
        format.json { render json: @learning_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning/skills/1
  # PATCH/PUT /learning/skills/1.json
  def update
    respond_to do |format|
      if @learning_skill.update(learning_skill_params)
        format.html { redirect_to @learning_skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_skill }
      else
        format.html { render :edit }
        format.json { render json: @learning_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning/skills/1
  # DELETE /learning/skills/1.json
  def destroy
    @learning_skill.destroy
    respond_to do |format|
      format.html { redirect_to learning_skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_skill
      @learning_skill = Learning::Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def learning_skill_params
      params.require(:learning_skill).permit(:body, :description)
    end
end
