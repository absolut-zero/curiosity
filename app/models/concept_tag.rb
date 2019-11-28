class ConceptTag < ApplicationRecord
  belongs_to :tag
  belongs_to :concept
end
