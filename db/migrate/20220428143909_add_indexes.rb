class AddIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index(:categories, :title, unique: true)
    add_index(:users, %i[first_name last_name], unique: true)
    add_index(:questions, :body, unique: true)
  end
end
