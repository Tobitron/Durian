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
    red = 255
    green = 0
    stepSize = 5
    array = []
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
     [255, 50, 17],
     [255, 50, 18],
     [255, 50, 19],
     [255, 50, 20],
     [255, 70, 21],
     [255, 70, 22],
     [255, 70, 23],
     [255, 80, 24],
     [255, 80, 25],
     [255, 80, 26],
     [255, 80, 27],
     [255, 80, 28],
     [255, 100, 29],
     [255, 100, 30],
     [255, 100, 31],
     [255, 100, 32],
     [255, 100, 33],
     [255, 100, 34],
     [255, 100, 35],
     [255, 100, 36],
     [255, 100, 37],
     [255, 100, 38],
     [255, 100, 39],
     [255, 100, 40],
     [255, 180, 41],
     [255, 180, 42],
     [255, 180, 43],
     [255, 180, 44],
     [255, 180, 45],
     [255, 180, 46],
     [255, 180, 47],
     [255, 180, 48],
     [255, 180, 49],
     [255, 180, 50],
     [255, 200, 51],
     [250, 220, 52],
     [245, 230, 53],
     [240, 250, 54],
     [235, 255, 55],
     [230, 255, 56],
     [225, 255, 57],
     [220, 255, 58],
     [215, 255, 59],
     [210, 255, 60],
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
     [145, 255, 73],
     [140, 255, 74],
     [135, 255, 75],
     [130, 255, 76],
     [125, 255, 77],
     [120, 255, 78],
     [115, 255, 79],
     [110, 255, 80],
     [105, 255, 81],
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
     [50, 255, 92],
     [45, 255, 93],
     [40, 255, 94],
     [35, 255, 95],
     [30, 255, 96],
     [25, 255, 97],
     [20, 255, 98],
     [15, 255, 99],
     [10, 255, 100],
     [5, 255, 101],
     [0, 255, 102]]

    "rgb(" + array[(city_review_average * 10)][0].to_s + "," + array[(city_review_average * 10)][1].to_s + ", 0)"
  end

end
