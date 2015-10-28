class AddReviewAverageToCity < ActiveRecord::Migration
  def change
    add_column :cities, :city_review_average, :float
  end
end
