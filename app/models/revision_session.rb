class RevisionSession < ApplicationRecord
  belongs_to :user
  has_many :revision_session_concepts, dependent: :destroy

  def self.todays_sessions(user)
    all_revision_sessions_with_date = RevisionSession.where(user: user).where("scheduled_at <= ?", Date.today.at_beginning_of_day).where(completed_at: nil).order(scheduled_at: :asc)
    @revision_sessions = all_revision_sessions_with_date.select { |session| !session.revision_session_concepts.length.zero? }
    @revision_sessions.length
  end
end
