class AddNewColumnsToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :current_question, foreign_key: { to_table: :questions }
    add_column :results, :correct_question, :integer, default: 0
  end
end
