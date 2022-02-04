class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct

      change_column_null(:answers, :body, false)
      add_foreign_key :answers, :questions
      change_column_default(:answers, :correct, true)

      t.timestamps
    end
  end
end
