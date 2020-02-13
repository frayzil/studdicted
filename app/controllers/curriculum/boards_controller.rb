class Curriculum::BoardsController < ApplicationController
  before_action :set_curriculum_board, only: [:show, :edit, :update, :destroy]

  # GET /curriculum/boards
  # GET /curriculum/boards.json
  def index
    @curriculum_boards = Curriculum::Board.all
  end

  # GET /curriculum/boards/1
  # GET /curriculum/boards/1.json
  def show
  end

  # GET /curriculum/boards/new
  def new
    @curriculum_board = Curriculum::Board.new
  end

  # GET /curriculum/boards/1/edit
  def edit
  end

  # POST /curriculum/boards
  # POST /curriculum/boards.json
  def create
    @curriculum_board = Curriculum::Board.new(curriculum_board_params)

    respond_to do |format|
      if @curriculum_board.save
        format.html { redirect_to @curriculum_board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum_board }
      else
        format.html { render :new }
        format.json { render json: @curriculum_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum/boards/1
  # PATCH/PUT /curriculum/boards/1.json
  def update
    respond_to do |format|
      if @curriculum_board.update(curriculum_board_params)
        format.html { redirect_to @curriculum_board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum_board }
      else
        format.html { render :edit }
        format.json { render json: @curriculum_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum/boards/1
  # DELETE /curriculum/boards/1.json
  def destroy
    @curriculum_board.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_board
      @curriculum_board = Curriculum::Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curriculum_board_params
      params.require(:curriculum_board).permit(:name)
    end
end
