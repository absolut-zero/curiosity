class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder, optional: true

  validates :name, presence: true
  validates :notes, presence: true

  has_many :concepts, dependent: :destroy
end
