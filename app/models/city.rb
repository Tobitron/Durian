class City < ActiveRecord::Base
  has_many :reviews

  # geocoded_by :name
  # after_validation :geocode
  validates :name, presence: true, uniqueness: true

  def calc_city_review_average
    review_aggregate = 0
    self.reviews.each do |review|
      review_aggregate += review.review_average if review.review_average != nil
    end
    review_aggregate / self.reviews.count
  end

  def has_reviews?
    self.reviews.count > 0
  end

  def self.cities_alphabetized
    array = City.all.map { |city| [city.name, city.id] }
    array.sort_by!{|word| word}
  end

  def color_gradient(city_review_average)
    red = 255
    green = 0
    stepSize = 5
    array = []

    while green < 255
      green += stepSize;
      if green > 255
        green = 255
      end
      array << [red, green]
    end

    while red > 0
      red -= stepSize;
      if red < 0
        red = 0
      end
      array << [red, green]
    end
    "rgb(" + array[(city_review_average * 10)][0].to_s + "," + array[(city_review_average * 10)][1].to_s + ", 0)"
  end
end
