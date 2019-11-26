class CreateSessionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :session_answers do |t|
      t.boolean :correct
      t.references :revision_session, foreign_key: true
      t.references :concept, foreign_key: true

      t.timestamps
    end
  end
end
