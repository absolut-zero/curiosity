class ConceptTag < ApplicationRecord
  has_many :tags
  has_many :concepts
end
