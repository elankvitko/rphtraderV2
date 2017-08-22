class CreateDiems < ActiveRecord::Migration[5.1]
  def change
    create_table :diems do |t|
      t.string :name
      t.datetime :start_time
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
