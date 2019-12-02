class FoldersController < ApplicationController
  def

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    @folder.save
    redirect_to documents_path
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
