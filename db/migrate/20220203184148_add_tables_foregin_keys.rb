class AddTablesForeginKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tests, :categories
    add_foreign_key :questions, :answers
    add_foreign_key :questions, :tests
  end
end
