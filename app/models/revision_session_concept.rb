class RevisionSessionConcept < ApplicationRecord
  belongs_to :revision_session
  belongs_to :concept

  has_many :session_answers
end
