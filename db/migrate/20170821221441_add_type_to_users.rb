class AddTypeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type_ep, :string, default: "Full Time / Part Time"
  end
end
