class Tag < ApplicationRecord
  belongs_to :concept_tags, dependent: :destroy
end
