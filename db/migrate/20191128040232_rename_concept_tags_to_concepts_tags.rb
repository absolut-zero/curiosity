class RenameConceptTagsToConceptsTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :concept_tags, :concepts_tags
  end
end
