class AddUserToRevisionSessions < ActiveRecord::Migration[5.2]
  def change
    add_reference :revision_sessions, :user, foreign_key: true
  end
end
