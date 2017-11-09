class CreateTrueFalses < ActiveRecord::Migration[5.1]
  def change
    create_table :true_falses do |t|
      t.text :question
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
