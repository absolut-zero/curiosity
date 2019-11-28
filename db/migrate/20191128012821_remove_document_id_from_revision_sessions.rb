class RemoveDocumentIdFromRevisionSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :revision_sessions, :document_id
  end
end
