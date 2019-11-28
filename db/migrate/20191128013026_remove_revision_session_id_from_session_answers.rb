class RemoveRevisionSessionIdFromSessionAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :session_answers, :revision_session_id
  end
end
