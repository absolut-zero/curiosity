class RevisionSession < ApplicationRecord
  belongs_to :user
  has_many :session_answers
end
