class AddZipToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :zip, :string, default: ""
  end
end
