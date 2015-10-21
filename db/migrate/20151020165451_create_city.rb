class CreateCity < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.timestamps null: false
    end
  end
end
