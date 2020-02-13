class Knowledge::ConceptsController < ApplicationController
  before_action :set_knowledge_concept, only: [:show, :edit, :update, :destroy]

  # GET /knowledge/concepts
  # GET /knowledge/concepts.json
  def index
    @knowledge_concepts = Knowledge::Concept.all
  end

  # GET /knowledge/concepts/1
  # GET /knowledge/concepts/1.json
  def show
  end

  # GET /knowledge/concepts/new
  def new
    @knowledge_concept = Knowledge::Concept.new
  end

  # GET /knowledge/concepts/1/edit
  def edit
  end

  # POST /knowledge/concepts
  # POST /knowledge/concepts.json
  def create
    @knowledge_concept = Knowledge::Concept.new(knowledge_concept_params)

    respond_to do |format|
      if @knowledge_concept.save
        format.html { redirect_to @knowledge_concept, notice: 'Concept was successfully created.' }
        format.json { render :show, status: :created, location: @knowledge_concept }
      else
        format.html { render :new }
        format.json { render json: @knowledge_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knowledge/concepts/1
  # PATCH/PUT /knowledge/concepts/1.json
  def update
    respond_to do |format|
      if @knowledge_concept.update(knowledge_concept_params)
        format.html { redirect_to @knowledge_concept, notice: 'Concept was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledge_concept }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge/concepts/1
  # DELETE /knowledge/concepts/1.json
  def destroy
    @knowledge_concept.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_concepts_url, notice: 'Concept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_concept
      @knowledge_concept = Knowledge::Concept.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def knowledge_concept_params
      params.require(:knowledge_concept).permit(:title, :description)
    end
end
