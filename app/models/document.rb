class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder

  has_many :revision_sessions
  has_many :concepts
end
