module Curriculum
  class ChaptersController < ApplicationController
    def index
      @branch = Curriculum::Branch.find params[:branch_id]
      @chapters = @branch.chapters
    end

    def new
      @branch = Curriculum::Branch.find params[:branch_id]
      @chapter = @branch.chapters.new
    end

    def create
      @branch = Curriculum::Branch.find params[:branch_id]
      @chapter = @branch.chapters.new(branch_params)

      respond_to do |format|
        if @chapter.save
          format.html {
            redirect_to curriculum_branch_chapters_path(@branch),
            notice: 'Branch was successfully created.'
          }
          format.json { render :show, status: :created, location: @chapter }
        else
          format.html { render :new }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @chapter = Curriculum::Chapter.find params[:id]
    end

    def update
      @chapter = Curriculum::Chapter.find params[:id]

      respond_to do |format|
        if @chapter.update(branch_params)
          format.html { redirect_to curriculum_branch_chapters_path(@chapter.branch), notice: 'Branch was successfully updated.' }
          format.json { render :show, status: :ok, location: @chapter }
        else
          format.html { render :edit }
          format.json { render json: @chapter.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @chapter = Curriculum::Chapter.find params[:id]
      @branch = @chapter.branch
      @chapter.destroy
      respond_to do |format|
        format.html { redirect_to curriculum_branch_chapters_path(@branch), notice: 'Branch was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def branch_params
      params.require(:curriculum_chapter).permit(:title, :description)
    end
  end
end