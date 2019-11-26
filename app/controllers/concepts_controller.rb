require_relative '../models/concept_generator'
class ConceptsController < ApplicationController
  def index
    # @concepts = Concept.all
    a = ConceptGenerator.generate(Document.find(params[:document_id]))
    raise
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def create
    @concept = Concept.new(concept_params)
    if @concept.save
      redirect_to concepts_path
    else
      render :index
    end
  end

  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concepts_params)
      redirect_to concepts_path
    else
      render :show
    end
  end

  private

  def concept_params
    params.require(:concept).permit(:name, :prompt, :content, :document_id)
  end
end
