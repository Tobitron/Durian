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

  # This algorithim isn't working well from a UX standpoint, going to replace manually until I can tweak the math
  def color_gradient(city_review_average)
    # red = 255
    # green = 0
    # stepSize = 5
    # array = []
    #
    # while green < 255
    #   green += stepSize;
    #   if green > 255
    #     green = 255
    #   end
    #   array << [red, green]
    # end
    #
    # while red > 0
    #   red -= stepSize;
    #   if red < 0
    #     red = 0
    #   end
    #   array << [red, green]
    # end

     array = [[255, 0, 1],
     [255, 0, 2],
     [255, 0, 3],
     [255, 0, 4],
     [255, 0, 5],
     [255, 0, 6],
     [255, 0, 7],
     [255, 0, 8],
     [255, 0, 9],
     [255, 0, 10],
     [255, 0, 11],
     [255, 0, 12],
     [255, 0, 13],
     [255, 0, 14],
     [255, 0, 15],
     [255, 0, 16],
     [255, 2, 17],
     [255, 5, 18],
     [255, 5, 19],
     [255, 10, 20],
     [255, 20, 21],
     [255, 30, 22],
     [255, 40, 23],
     [255, 50, 24],
     [255, 60, 25],
     [255, 70, 26],
     [255, 70, 27],
     [255, 70, 28],
     [255, 80, 29],
     [255, 80, 30],
     [255, 80, 31],
     [255, 80, 32],
     [255, 80, 33],
     [255, 80, 34],
     [255, 80, 35],
     [255, 80, 36],
     [255, 80, 37],
     [255, 80, 38],
     [255, 80, 39],
     [255, 80, 40],
     [255, 100, 41],
     [255, 100, 42],
     [255, 100, 43],
     [255, 100, 44],
     [255, 100, 45],
     [255, 100, 46],
     [255, 100, 47],
     [255, 100, 48],
     [255, 100, 49],
     [255, 100, 50],
     [255, 200, 51],
     [255, 220, 52],
     [255, 230, 53],
     [255, 250, 54],
     [255, 255, 55],
     [230, 255, 56],
     [255, 255, 57],
     [255, 255, 58],
     [255, 255, 59],
     [255, 255, 60],
     [205, 255, 61],
     [200, 255, 62],
     [195, 255, 63],
     [190, 255, 64],
     [185, 255, 65],
     [180, 255, 66],
     [175, 255, 67],
     [170, 255, 68],
     [165, 255, 69],
     [160, 255, 70],
     [155, 255, 71],
     [150, 255, 72],
     [120, 255, 73],
     [120, 255, 74],
     [120, 255, 75],
     [120, 255, 76],
     [120, 255, 77],
     [120, 255, 78],
     [100, 255, 79],
     [100, 255, 80],
     [100, 255, 81],
     [100, 255, 82],
     [95, 255, 83],
     [90, 255, 84],
     [85, 255, 85],
     [80, 255, 86],
     [75, 255, 87],
     [70, 255, 88],
     [65, 255, 89],
     [60, 255, 90],
     [55, 255, 91],
     [20, 255, 92],
     [20, 255, 93],
     [20, 255, 94],
     [20, 255, 95],
     [20, 255, 96],
     [20, 255, 97],
     [15, 255, 98],
     [15, 255, 99],
     [10, 255, 100],
     [5, 255, 101],
     [0, 255, 102]]

    "rgb(" + array[(city_review_average * 10)][0].to_s + "," + array[(city_review_average * 10)][1].to_s + ", 0)"
  end

end
