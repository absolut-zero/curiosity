class RevisionSessionsController < ApplicationController
  def index
    all_revision_sessions_with_date = RevisionSession.where(user: current_user).where.not(scheduled_at: nil).where(completed_at: nil).order(scheduled_at: :asc)
    @revision_sessions = all_revision_sessions_with_date.select { |session| !session.revision_session_concepts.length.zero? }
  end

  def create_from_doc
    @document = Document.find(params[:id])
    if @document.concepts
      redirect_to revision_session_path(RevisionSessionGenerator.generate_from_document(@document, current_user))
    else
      redirect_to document_path(@document)
    end
  end

  def create_from_tag
    @tag = Tag.find(params[:id])
    if @tag.concepts
      redirect_to revision_session_path(RevisionSessionGenerator.generate_from_tags([@tag], current_user))
    else
      redirect_to tags_path
    end
  end

  def create_from_concept
    @concepts = Concept.find(params[:id].split('/'))
    redirect_to revision_session_path(RevisionSessionGenerator.generate_from_concepts(@concepts, current_user))
  end

  def show
    @revision_session = RevisionSession.find(params[:id])
    @session_answers = SessionAnswerGenerator.generate(@revision_session)
    @revision_session_concepts = @revision_session.revision_session_concepts
    @next_session = RevisionSession.where(user: current_user).where("scheduled_at <= ?", Date.today.at_beginning_of_day).where.not(id: params[:id]).where(completed_at: nil).order(scheduled_at: :asc).first
  end

  def update
    @revision_session = RevisionSession.find(params[:id])
    @revision_session.completed_at = Date.today.at_beginning_of_day
    @revision_session.save
    @next_session = RevisionSession.where(user: current_user).where("scheduled_at <= ?", Date.today.at_beginning_of_day).where.not(id: params[:id]).where(completed_at: nil).order(scheduled_at: :asc).first
    if params[:save_and_continue]
      redirect_to revision_session_path(@next_session)
    else
      redirect_to revision_sessions_path
    end
  end

  def destroy
    @revision_session = RevisionSession.find(params[:id])
    @revision_session.destroy
    redirect_to revision_sessions_path
  end
end
