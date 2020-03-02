module Curriculum
  class SectionsController < ApplicationController
    def index
      @chapter = Curriculum::Chapter.find params[:chapter_id]
      @sections = @chapter.sections
    end

    def new
      @chapter = Curriculum::Chapter.find params[:chapter_id]
      @section = @chapter.sections.new
    end

    def create
      @chapter = Curriculum::Chapter.find params[:chapter_id]
      @section = @chapter.sections.new(chapter_params)

      respond_to do |format|
        if @section.save
          format.html {
            redirect_to curriculum_chapter_sections_path(@chapter),
            notice: 'Section was successfully created.'
          }
          format.json { render :show, status: :created, location: @section }
        else
          format.html { render :new }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @section = Curriculum::Section.find params[:id]
    end

    def update
      @section = Curriculum::Section.find params[:id]

      respond_to do |format|
        if @section.update(chapter_params)
          format.html { redirect_to curriculum_chapter_sections_path(@section.chapter), notice: 'Section was successfully updated.' }
          format.json { render :show, status: :ok, location: @section }
        else
          format.html { render :edit }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @section = Curriculum::Section.find params[:id]
      @chapter = @section.chapter
      @section.destroy
      respond_to do |format|
        format.html { redirect_to curriculum_chapter_sections_path(@chapter), notice: 'Section was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def chapter_params
      params.require(:curriculum_section).permit(:title, :description)
    end
  end
end