class AddNewColumns < ActiveRecord::Migration[7.0]
  def change
    add_reference(:tests, :author)
  end
end
