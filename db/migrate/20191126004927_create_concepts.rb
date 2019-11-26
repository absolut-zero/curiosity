class CreateConcepts < ActiveRecord::Migration[5.2]
  def change
    create_table :concepts do |t|
      t.text :prompt
      t.text :content
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
