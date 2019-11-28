class AddRevisionSessionConceptIdToSessionAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :session_answers, :revision_session_concept, foreign_key: true
  end
end
