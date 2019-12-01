class Concept < ApplicationRecord
  belongs_to :document

  has_many :revision_session_concepts, dependent: :destroy
  has_and_belongs_to_many :tags
end
