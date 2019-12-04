require_relative '../models/concept_generator'

class ConceptsController < ApplicationController

  def params
    request.parameters
  end

  def index
    @document = Document.find(params[:document_id])
    @concepts = ConceptGenerator.generate(@document)

    @document.submitted_at = Date.today
    @document.save
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def create
    new_concepts = []
    @document = Document.find(params[:document_id])
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
      new_concepts << new_concept if new_concept.save
    end
    if new_concepts.count == params[:concept].count
      RevisionSessionGenerator.create_spaced_repitition(@document, current_user)
      redirect_to revision_sessions_path
    else
      redirect_to document_concepts_path(@document)
    end

    # if new_concept.save
    # else
    #   render :new
    # end
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
    @all_user_folders = Folder.where(user: current_user)
    @all_user_documents = Document.where(user: current_user)

    @all_user_concepts = []
    @all_user_documents.each { |doc| @all_user_concepts << doc.concepts }
    @all_user_concepts.flatten!
    @concepts = @all_user_concepts

    @all_user_tags = []
    @all_user_concepts.each { |concept| @all_user_tags << concept.tags }

    @folders = @all_user_folders.reject { |folder| folder.documents.length.zero? }
    @documents = @all_user_documents.reject { |doc| doc.concepts.length.zero? }
    @tags = @all_user_tags.flatten.uniq!

    @fol_concepts = Concept.joins(document: :folder).where(document: { folders: { id: params[:folder] } }) if params[:folder].present?
    @doc_concepts = Concept.where(document_id: params[:document]) if params[:document].present?
    @tag_concepts = Concept.includes(:tags).where(tags: { id: params[:tag] }) if params[:tag].present?

    if params[:folder].present? || params[:document].present? || params[:tag].present?
      @concepts = [@fol_concepts, @doc_concepts, @tag_concepts].flatten.compact.uniq
    else
      @concepts = @all_user_concepts
    end
    @concept_ids = []
    @concepts.each { |c| @concept_ids << c.id }
  end
  # private

  # def concept_params
  #   params.require(:concept).permit(:tags => [])
  # end
end
