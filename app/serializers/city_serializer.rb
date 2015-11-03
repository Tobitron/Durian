class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :city_review_average, :city_color, :city_reviews

  def city_reviews
    object.reviews
  end

  def city_color
    object.color_gradient
  end
end
