class Folder < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  has_many :documents, dependent: :destroy
end
