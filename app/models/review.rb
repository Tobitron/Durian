class Review < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  validates :value, presence: { message: "You must input value." },
           numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  validates :beauty, presence: { message: "You must input beauty." },
            numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  validates :activities, presence: { message: "You must input a activity score." },
            numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  validates :friendliness, presence: { message: "You must input a friendliness score." },
            numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  validates :food, presence: { message: "You must input a food score." },
            numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  validates :touristy, presence: { message: "You must input a touristy score." },
            numericality: { only_integer: true, greater_than: 0.0, less_than: 10.01 }

  def calc_review_average
    (value + beauty + (activities * 1.5) + (friendliness * 0.5) + food + (10 - touristy)) / 6
  end

end
