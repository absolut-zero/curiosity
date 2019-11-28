class Concept < ApplicationRecord
  belongs_to :document

  has_many :session_answers
  has_and_belongs_to_many :tags
end
