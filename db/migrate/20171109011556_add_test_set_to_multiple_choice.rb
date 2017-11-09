class AddTestSetToMultipleChoice < ActiveRecord::Migration[5.1]
  def change
    add_column :multiple_choices, :test_set_id, :integer
    add_index :multiple_choices, :test_set_id
  end
end
