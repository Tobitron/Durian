class AddReviewAverageToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :review_average, :float
  end
end
