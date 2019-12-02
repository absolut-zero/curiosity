class Concept < ApplicationRecord
  belongs_to :document

  validates :prompt, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false

  has_many :revision_session_concepts, dependent: :destroy
  has_and_belongs_to_many :tags
end
