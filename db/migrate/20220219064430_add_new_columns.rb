class AddNewColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :author_id, :string
    add_foreign_key :tests, :users, column: :author_id
  end
end
