class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :city_color, :cleaned_city_review_average, :city_reviews

  def cleaned_city_review_average
    unless object.city_review_average.nil?
      cleaned_average = (object.city_review_average * 10).to_i
      cleaned_average.to_s + "%"
    end
  end

  def city_reviews
    object.reviews
  end

  def city_color
    object.color_gradient
  end
end
