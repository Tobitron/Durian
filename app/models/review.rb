class Review < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  generic_validation_message = "Must have an input value."

  validates_uniqueness_of :user_id, scope: [:city_id], message: "You have already reviewed this city."

  validates :description, presence: true

  validates :value, presence: { message: generic_validation_message },
           numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  validates :beauty, presence: { message: generic_validation_message },
            numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  validates :activities, presence: { message: generic_validation_message },
            numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  validates :friendliness, presence: { message: generic_validation_message },
            numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  validates :food, presence: { message: generic_validation_message },
            numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  validates :touristy, presence: { message: generic_validation_message },
            numericality: { only_integer: true, greater_than: -1, less_than: 10.01 }

  def calc_review_average
    (value + beauty + (activities * 1.5) + (friendliness * 0.5) + food + (10 - touristy)) / 6
  end

end
