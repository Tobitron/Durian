class AddBiasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :food, :integer
    add_column :users, :outdoors, :integer
    add_column :users, :city_person, :integer
    add_column :users, :off_beaten_track, :integer
    add_column :users, :touristy, :integer
    add_column :users, :shopping, :integer
    add_column :users, :danger, :integer
    add_column :users, :party, :integer
  end
end
