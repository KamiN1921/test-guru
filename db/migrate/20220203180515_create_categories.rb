class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      change_column_null(:categories, :title, false)

      t.timestamps
    end
  end
end
