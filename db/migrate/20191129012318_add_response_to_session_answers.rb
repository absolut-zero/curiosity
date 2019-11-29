class AddResponseToSessionAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :session_answers, :response, :text
  end
end
