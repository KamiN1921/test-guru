class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|

      t.references :users, foreign_key: true, null: false
      t.references :tests, foreign_key: true, null: false
      t.boolean :clear, null: false, default: false

      t.timestamps
    end
  end
end