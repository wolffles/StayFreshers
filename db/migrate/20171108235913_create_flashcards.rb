class CreateFlashcards < ActiveRecord::Migration[5.1]
  def change
    create_table :flashcards do |t|
      t.text :question
      t.text :description

      t.timestamps
    end
  end
end
