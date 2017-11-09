class AddTestSetToFlashcards < ActiveRecord::Migration[5.1]
  def change
    add_column :flashcards, :test_set_id, :integer
    add_index :flashcards, :test_set_id
  end
end
