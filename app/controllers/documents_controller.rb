class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
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


  private

  def document_params
    params.require(:document).permit(:name, :notes, :submitted_at, :end_at, :user, :folder)
  end

end
