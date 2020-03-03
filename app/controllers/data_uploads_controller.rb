class DataUploadsController < ApplicationController
  def new
    @uploader = DataUploadService.new
  end

  def create
    @uploader = DataUploadService.new(uploader_params[:file])
    send_file @uploader.execute
  end

  private

  def uploader_params
    params.require(:uploader).permit(:file)
  end
end
