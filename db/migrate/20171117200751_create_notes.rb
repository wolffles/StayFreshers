class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
