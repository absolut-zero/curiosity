class RevisionSession < ApplicationRecord
  belongs_to :document

  has_many :session_answers
end
