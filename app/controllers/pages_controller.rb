class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @documents_all = Document.where(user: current_user)
    @drafts = @documents_all.select { |doc| doc.concepts.length.zero? }

    all_revision_sessions_with_date = RevisionSession.where(user: current_user).where("scheduled_at <= ?", Date.today.at_beginning_of_day).where(completed_at: nil).order(scheduled_at: :asc)
    @revision_sessions = all_revision_sessions_with_date.select { |session| !session.revision_session_concepts.length.zero? }
  end

  def archive
    all_archived_revision_sessions_with_date = RevisionSession.where(user: current_user).where.not(completed_at: nil).order(completed_at: :asc)
    @archived_revision_sessions = all_archived_revision_sessions_with_date.select { |session| !session.revision_session_concepts.length.zero? }
  end
end
