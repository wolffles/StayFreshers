class CreateTestSets < ActiveRecord::Migration[5.1]
  def change
    create_table :test_sets do |t|
      t.text :name
      t.text :subject
      t.integer :user_id

      t.timestamps
    end
    add_index :test_sets, :user_id
  end
end
