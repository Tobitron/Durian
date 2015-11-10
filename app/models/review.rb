class Review < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  
  def calc_review_average
    (value + beauty + activities + friendliness + food + (10 - touristy)) / 6
  end

end
