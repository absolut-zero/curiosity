class RevisionSessionsController < ApplicationController
  def index

  end

  def create_from_doc
    # RevisionSessionGenerator.generate_from_document(Document.find())
  end

  def create_from_tag
  end

  def show
    @revision_session = RevisionSession.find(params[:id])
    @session_answers = SessionAnswerGenerator.generate(@revision_session)
    @revision_session_concepts = @revision_session.revision_session_concepts
  end

  def answers

  end
end
