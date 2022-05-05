class AddNewColumnToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :published, :boolean, default: false
  end
end
