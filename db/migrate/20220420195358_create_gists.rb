class CreateGists < ActiveRecord::Migration[7.0]
  def change
    create_table :gists do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.references :question, foreign_key: true, null: false
      t.string :url
      t.timestamps
    end
  end
end
