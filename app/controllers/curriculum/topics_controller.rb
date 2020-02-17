class Curriculum::TopicsController < ApplicationController
  before_action :set_curriculum_topic, only: [:show, :edit, :update, :destroy]

  # GET /curriculum/topics
  # GET /curriculum/topics.json
  def index
    @curriculum_topics = Curriculum::Topic.all
  end

  # GET /curriculum/topics/1
  # GET /curriculum/topics/1.json
  def show
  end

  # GET /curriculum/topics/new
  def new
    @curriculum_topic = Curriculum::Topic.new
  end

  # GET /curriculum/topics/1/edit
  def edit
  end

  # POST /curriculum/topics
  # POST /curriculum/topics.json
  def create
    @curriculum_topic = Curriculum::Topic.new(curriculum_topic_params)

    respond_to do |format|
      if @curriculum_topic.save
        format.html { redirect_to @curriculum_topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum_topic }
      else
        format.html { render :new }
        format.json { render json: @curriculum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum/topics/1
  # PATCH/PUT /curriculum/topics/1.json
  def update
    respond_to do |format|
      if @curriculum_topic.update(curriculum_topic_params)
        format.html { redirect_to @curriculum_topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum_topic }
      else
        format.html { render :edit }
        format.json { render json: @curriculum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum/topics/1
  # DELETE /curriculum/topics/1.json
  def destroy
    @curriculum_topic.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_topic
      @curriculum_topic = Curriculum::Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curriculum_topic_params
      params.require(:curriculum_topic).permit(:title, :type, :description, :board_id)
    end
end
