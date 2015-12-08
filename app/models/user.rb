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
    case self.outdoors
      when 1
        "You won't find #{self.first_name} in the outdoors."
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

  def city_person_bias_text
    case self.city_person
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

  def off_beaten_track_text
    case self.off_beaten_track
      when 1
        "Prefers to be in a place with other tourists."
      when 2
        "Not bothered by other tourists."
      when 3
        "Not exactly allergic to tourists, but seeks out the next hot destination."
      when 4
        "Wants to be as far from other tourists as possible."
      else
        "Something went wrong"
    end
  end

  def shopping_bias_text
    case self.shopping
      when 1
        "Consumerism and travel don't mix."
      when 2
        "Might pickup a souvenir or two, but not why they travel by any means."
      when 3
        "Likes to take home souvenirs but not a focus."
      when 4
        "Loves shopping, this is a major aspect of traveling."
      else
        "Something went wrong"
    end
  end

  def danger_bias_text
    case self.danger
      when 1
        "Danger is my middle name. Bring it on."
      when 2
        "Doesn't really think about sketchiness unless they're somewhere really bad."
      when 3
        "Likes to travel in groups and avoid the seedy parts of town whenever possible."
      when 4
        "Very risk adverse, would very consciously stay away from dangerous areas."
      else
        "Something went wrong"
    end
  end

  def party_bias_text
    case self.party
      when 1
        "Actively tries to not be in loud party environments."
      when 2
        "Might go to a bar every now and then, not a focus."
      when 3
        "Likes a good party, a vacation wouldn't be a vacation without it!"
      when 4
        "Sobriety means you aren't doing it right. Travel = Party."
      else
        "Something went wrong"
    end
  end

end
