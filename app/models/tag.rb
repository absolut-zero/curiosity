class Tag < ApplicationRecord
  has_many :concept_tags
  has_many :concepts, through: :concept_tags
end
