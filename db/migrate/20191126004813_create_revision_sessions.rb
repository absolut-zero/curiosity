class CreateRevisionSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :revision_sessions do |t|
      t.datetime :scheduled_at
      t.datetime :completed_at
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
