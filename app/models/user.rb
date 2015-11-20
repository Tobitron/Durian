class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews

  def food_bias_text
    case self.food
      when 1
        "Doesn't care much about food."
      when 2
        "Likes a nice meal but won't go out of the way."
      when 3
        "Food is an essential part of traveling."
      when 4
        "Total foodie, food basically defines the trip."
      else
        "Something went wrong"
    end
  end

  def outdoors_bias_text
    case self.food
      when 1
        "Won't find them in the outdoors."
      when 2
        "Does going to a city park count as outdoors?"
      when 3
        "Appreciates nature, likes to get outside when possible."
      when 4
        "A nature lover, always trying to explore the outdoors."
      else
        "Something went wrong"
    end
  end

  # t.integer  "food"
  # t.integer  "outdoors"
  # t.integer  "city_person"
  # t.integer  "off_beaten_track"
  # t.integer  "touristy"
  # t.integer  "shopping"
  # t.integer  "danger"
  # t.integer  "party"
end
