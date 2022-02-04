class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      change_column_default(:tests, :level, 0)
      change_column_null(:tests, :title, false)
      add_foreign_key :tests, :categories

      t.timestamps
    end
  end
end
