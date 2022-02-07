class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, default: true
      add_foreign_key :answers, :questions

      t.timestamps
    end
  end
end
