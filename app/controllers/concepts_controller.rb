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

  def search
    @my_docs = Document.where(user: current_user)
    @my_folders = Folder.where(user: current_user)
    @my_doc_concepts = @my_docs.map do |doc|
      doc.concepts
    end
    @my_concepts = @my_doc_concepts.flatten
    @my_concept_tags = @my_concepts.map do |concept|
      concept.tags
    end
    @my_tags = @my_concept_tags.flatten

    if params[:folder].present? || params[:document].present? || params[:tag].present?
      tags = @my_tags.map do |tag|
        tag.name
      end

      folders = @my_folders.map do |folder|
        folder.name
      end

      documents = @my_docs.map do |doc|
        doc.name
      end

      count = 1
      count += 1 if folders.count == 0
      count += 1 if documents.count == 0
      count += 1 if tags.count == 0

      filter = [tags, folders, documents].flatten.uniq!

      @my_filtered_concepts = @my_concepts.select { |concept| filter.count(concept) > (3 - count) }



    else
      @my_filtered_concepts = Concept.where(user: current_user)
    end

  end
  # private

  # def concept_params
  #   params.require(:concept).permit(:tags => [])
  # end
end
