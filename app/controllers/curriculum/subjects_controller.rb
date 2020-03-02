module Curriculum
  class SubjectsController < ApplicationController
    def index
      @board = Curriculum::Board.find params[:board_id]
      @subjects = @board.subjects
    end

    def new
      @board = Curriculum::Board.find params[:board_id]
      @subject = @board.subjects.new
    end

    def create
      @board = Curriculum::Board.find params[:board_id]
      @subject = @board.subjects.new(subject_params)

      respond_to do |format|
        if @subject.save
          format.html {
            redirect_to curriculum_board_subjects_path(@board),
            notice: 'Subject was successfully created.'
          }
          format.json { render :show, status: :created, location: @subject }
        else
          format.html { render :new }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @subject = Curriculum::Subject.find params[:id]
    end

    def update
      @subject = Curriculum::Subject.find params[:id]

      respond_to do |format|
        if @subject.update(subject_params)
          format.html { redirect_to curriculum_board_subjects_path(@subject.board), notice: 'Subject was successfully updated.' }
          format.json { render :show, status: :ok, location: @subject }
        else
          format.html { render :edit }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @subject = Curriculum::Subject.find params[:id]
      @board = @subject.board
      @subject.destroy
      respond_to do |format|
        format.html { redirect_to curriculum_board_subjects_path(@board), notice: 'Subject was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def subject_params
      params.require(:curriculum_subject).permit(:title, :description)
    end
  end
end