class Folder < ApplicationRecord
  belongs_to :users

  has_many :documents, dependent: :destroy
end
