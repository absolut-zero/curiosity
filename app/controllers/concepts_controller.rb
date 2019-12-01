require_relative '../models/concept_generator'
require 'pry'
class ConceptsController < ApplicationController

  def params
    request.parameters
  end

  def index
    @document = Document.find(params[:document_id])
    @concepts = ConceptGenerator.generate(@document)

  end

  def show
    @concept = Concept.find(params[:id])
  end

  def create
    params[:concept].each do |concept|
      new_concept = Concept.new(prompt: concept[:prompt], content: concept[:content])
      tags = []
      if concept[:tags]
        concept[:tags].each do |tag|
          begin
            tags << Tag.find(Integer(tag))
          rescue ArgumentError, TypeError
            tags << Tag.create!(name: tag)
          end
        end
      end
      new_concept.tags = tags
      new_concept.document_id = params[:document_id]
      new_concept.save
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

  # private

  # def concept_params
  #   params.require(:concept).permit(:tags => [])
  # end
end
