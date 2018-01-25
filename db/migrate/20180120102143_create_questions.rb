class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question_str, required: true
      t.string :opt1, required: true
      t.integer :marks1, required: true
      t.string :opt2, default: ''
      t.integer :marks2, default: 0
      t.string :opt3, default: ''
      t.integer :marks3, default: 0
      t.string :opt4, default: ''
      t.integer :marks4, default: 0

      t.timestamps
    end
  end
end
