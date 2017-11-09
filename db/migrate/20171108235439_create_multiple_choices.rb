class CreateMultipleChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :multiple_choices do |t|
      t.text :question
      t.text :correct_answer
      t.text :a
      t.text :b
      t.text :c
      t.text :d

      t.timestamps
    end
  end
end
