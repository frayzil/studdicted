module Curriculum
  class BranchesController < ApplicationController
    def index
      @subject = Curriculum::Subject.find params[:subject_id]
      @branches = @subject.branches
    end

    def new
      @subject = Curriculum::Subject.find params[:subject_id]
      @branch = @subject.branches.new
    end

    def create
      @subject = Curriculum::Subject.find params[:subject_id]
      @branch = @subject.branches.new(subject_params)

      respond_to do |format|
        if @branch.save
          format.html {
            redirect_to curriculum_subject_branches_path(@subject),
            notice: 'Branch was successfully created.'
          }
          format.json { render :show, status: :created, location: @branch }
        else
          format.html { render :new }
          format.json { render json: @branch.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @branch = Curriculum::Branch.find params[:id]
    end

    def update
      @branch = Curriculum::Branch.find params[:id]

      respond_to do |format|
        if @branch.update(subject_params)
          format.html { redirect_to curriculum_subject_branches_path(@branch.subject), notice: 'Branch was successfully updated.' }
          format.json { render :show, status: :ok, location: @branch }
        else
          format.html { render :edit }
          format.json { render json: @branch.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @branch = Curriculum::Branch.find params[:id]
      @subject = @branch.subject
      @branch.destroy
      respond_to do |format|
        format.html { redirect_to curriculum_subject_branches_path(@subject), notice: 'Branch was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def subject_params
      params.require(:curriculum_branch).permit(:title, :description)
    end
  end
end