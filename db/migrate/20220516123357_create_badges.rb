class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :file, null: false, default:"./assets/images/default_badge.jpg"
      t.string :rule, null: false
      t.string :param


      t.timestamps
    end
  end
end
