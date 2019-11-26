class CreateConceptTags < ActiveRecord::Migration[5.2]
  def change
    create_table :concept_tags do |t|
      t.references :concept, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
