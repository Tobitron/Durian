class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :city_id, null: false
      t.timestamps null: false
    end
  end
end
