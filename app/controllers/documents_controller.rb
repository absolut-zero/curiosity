class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @document = Document.new
    @folder = Folder.new
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @documents = Document.all
    @document = Document.new(document_params)
    @document.folder = Folder.find(params[:document][:folder])
    @document.user = current_user
      if @document.save
        redirect_to documents_path
      else
        render :index
      end
  end

  def update
    @document = Document.find(params[:id])
    @document.user = current_user
      if @document.update(document_params)
        redirect_to documents_path
      else
        render :show
      end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end



  private

  def document_params
    params.require(:document).permit(:name, :notes, :submitted_at, :end_at)
  end

end
