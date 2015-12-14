class City < ActiveRecord::Base
  has_many :reviews

  geocoded_by :name
  after_validation :geocode

  def calc_city_review_average
    review_aggregate = 0
    self.reviews.each do |review|
      review_aggregate = review_aggregate + review.review_average if review.review_average != nil
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

  def color_gradient
    #TODO I'll refactor this into a method that increments somehow, but for now just need something that works
    case self.city_review_average
      when 0.0..0.34
        "FF0000"
      when 0.34..0.67
        "FF1100"
      when 0.67..1.0
        "FF2200"
      when 1.0..1.33
        "FF3300"
      when 1.34..1.67
        "FF4400"
      when 1.67..2.0
        "FF5500"
      when 2.0..2.34
        "FF6600"
      when 2.34..2.67
        "FF7700"
      when 2.67..3.0
        "FF8800"
      when 3.0..3.34
        "FF9900"
      when 3.34..3.67
        "FFAA00"
      when 3.67..4.0
        "FFBB00"
      when 4.0..4.34
        "FFCC00"
      when 4.34..4.67
        "FFDD00"
      when 4.67..5.0
        "FFEE00"
      when 5.0..5.34
        "FFFF00"
      when 5.34..5.67
        "EEFF00"
      when 5.67..6.0
        "DDFF00"
      when 6.0..6.34
        "DDFF00"
      when 6.34..6.68
        "BBFF00"
      when 6.68..7.0
        "AAFF00"
      when 7.0..7.34
        "88FF00"
      when 7.34..7.67
        "66FF00"
      when 7.67..8.0
        "55FF00"
      when 8.0..8.34
        "44FF00"
      when 8.34..8.67
        "33FF00"
      when 8.67..9.0
        "22FF00"
      when 9.0..9.34
        "11FF00"
      when 9.34..9.67
        "11FF00"
      when 9.67..10.00
        "00FF00"
      else
        "00FF00"
    end
  end
end
