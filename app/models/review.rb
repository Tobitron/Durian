class Review < ActiveRecord::Base
  belongs_to :city

  def calc_review_average
    (value + beauty + activities + friendliness + food + (10 - touristy)) / 6
  end
end
