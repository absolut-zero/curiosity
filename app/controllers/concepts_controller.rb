require_relative '../models/concept_generator'
class ConceptsController < ApplicationController
  def index
    @document = Document.find(params[:document_id])
    @concepts = ConceptGenerator.generate(@document)

  end

  def show
    @concept = Concept.find(params[:id])
  end

  def create
    # @concept = Concept.new(concept_params)
    # @concept.save

    params[:concept].each do |concept|
      @concept = Concept.new(prompt: concept[:prompt], content: concept[:content])
      @concept.document_id = params[:document_id]
      @concept.save
    end
    redirect_to documents_path
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
  #   params.require(:concept).each do |concept|
  #     concept.permit(:prompt, :content)
  #   end
  end
end
