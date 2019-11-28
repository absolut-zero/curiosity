class Concept < ApplicationRecord
  belongs_to :document

  has_many :session_answers
  has_many :concept_tags
  has_many :tags, through: :concept_tags
end
