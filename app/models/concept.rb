class Concept < ApplicationRecord
  belongs_to :document

  has_many :session_answers
  has_many :tags
end
