class SessionAnswersController < ApplicationController
  def index
    @revision_session = RevisionSession.find(params[:revision_session_id])
    @revision_session_concepts = @revision_session.revision_session_concepts

    @next_session = RevisionSession.where(user: current_user).where("scheduled_at <= ?", Date.today.at_beginning_of_day).where.not(id: params[:revision_session_id]).where(completed_at: nil).order(scheduled_at: :asc).first
  end

  def create
    params[:session_answer].each do |session_answer|
      @answer = SessionAnswer.create!(response: session_answer[:response], revision_session_concept_id: session_answer[:session_concept_id].to_i)
    end
    redirect_to revision_session_session_answers_path(RevisionSession.find(params[:revision_session_id]))
  end

  def update
    @revision_session = RevisionSession.find(params[:revision_session_id])
    @revision_session.completed_at = Date.today.at_beginning_of_day
    @revision_session.save
    params[:session_answers].each do |session_answer|
      @answer = SessionAnswer.find(session_answer[0])
      @answer.correct = session_answer[1][:correct]
      @answer.save
    end
    if params[:save_and_continue]
      redirect_to revision_session_path(params[:save_and_continue])
    else
      redirect_to revision_sessions_path
    end
  end
end
