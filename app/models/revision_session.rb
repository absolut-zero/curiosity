class RevisionSession < ApplicationRecord
  belongs_to :user
  has_many :revision_session_concepts
end
