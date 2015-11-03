class City < ActiveRecord::Base
  has_many :reviews

  def calc_city_review_average
    review_aggregate = 0
    self.reviews.each do |review|
      review_aggregate = review_aggregate + review.review_average if review.review_average != nil
    end
    review_aggregate / self.reviews.count
  end

  def color_gradient
    # I'll refactor this into a method that increments somehow, but for now HEX codes make my brain hurt
    # and I just want something that works
    case self.city_review_average
      when 0.0..0.33
        "FF0000"
      when 0.34..0.66
        "FF1100"
      when 0.67..0.99
        "FF2200"
      when 1.0..1.33
        "FF3300"
      when 1.34..1.66
        "FF4400"
      when 1.67..1.99
        "FF5500"
      when 2.0..2.33
        "FF6600"
      when 2.34..2.66
        "FF7700"
      when 2.67..2.99
        "FF8800"
      when 2.0..2.33
        "FF9900"
      when 2.34..2.66
        "FFAA00"
      when 2.67..2.99
        "FFBB00"
      when 3.0..3.33
        "FFCC00"
      when 3.34..3.66
        "FFDD00"
      when 3.67..3.99
        "FFEE00"
      when 4.0..4.33
        "FFFF00"
      when 4.34..4.66
        "EEFF00"
      when 4.67..4.99
        "DDFF00"
      when 5.0..5.33
        "DDFF00"
      when 5.34..5.66
        "CCFF00"
      when 5.67..5.99
        "BBFF00"
      when 6.0..6.33
        "AAFF00"
      when 6.34..6.66
        "BBFF00"
      when 6.67..6.99
        "99FF00"
      when 7.0..7.33
        "88FF00"
      when 7.34..7.66
        "77FF00"
      when 7.67..7.99
        "66FF00"
      when 8.0..8.33
        "55FF00"
      when 8.34..8.66
        "44FF00"
      when 8.67..8.99
        "33FF00"
      when 9.0..9.33
        "22FF00"
      when 9.34..9.66
        "11FF00"
      when 9.67..9.99
        "00FF00"
      else
        "00FF00"
    end
  end
end
