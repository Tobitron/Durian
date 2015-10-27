class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :city_reviews

  def city_reviews
    object.reviews
  end

end
