class AddTestSetToTrueFalse < ActiveRecord::Migration[5.1]
  def change
    add_column :true_falses, :test_set_id, :integer
    add_index :true_falses, :test_set_id
  end
end
