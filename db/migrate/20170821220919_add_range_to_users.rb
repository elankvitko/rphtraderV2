class AddRangeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :range, :string, default: "3"
  end
end
