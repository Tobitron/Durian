class AddAttributesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :value, :float
    add_column :reviews, :beauty, :float
    add_column :reviews, :activities, :float
    add_column :reviews, :friendliness, :float
    add_column :reviews, :food, :float
    add_column :reviews, :touristy, :float
  end
end
