class CreateRevisionSessionConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :revision_session_concepts do |t|
      t.references :revision_session, foreign_key: true
      t.references :concept, foreign_key: true

      t.timestamps
    end
  end
end
