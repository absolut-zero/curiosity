class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :notes
      t.datetime :submitted_at
      t.datetime :end_at
      t.references :user, foreign_key: true
      t.references :folder, foreign_key: true

      t.timestamps
    end
  end
end
