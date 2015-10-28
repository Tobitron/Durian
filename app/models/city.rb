class City < ActiveRecord::Base
  has_many :reviews

  def calc_city_review_average
    review_aggregate = 0
    self.reviews.each do |review|
      review_aggregate = review_aggregate + review.review_average if review.review_average != nil
    end
    review_aggregate / self.reviews.count
  end
end
