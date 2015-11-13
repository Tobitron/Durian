class CitiesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @cities = City.all
    render json: @cities
  end

  def create
    latitude = params[:latitude].to_f.round(2)
    longitude = params[:longitude].to_f.round(2)
    clicked_city = City.find_by(latitude: latitude, longitude: longitude)
    @clicked_city_data = {name: clicked_city.name, review_percentage: clicked_city.city_review_average, reviews: clicked_city.reviews} # go through each variable I need and put in this hash
    respond_to do |format|
      format.js {render json: @clicked_city_data}
    end
  end

  def update
    latitude = params[:latitude].to_f.round(2)
    longitude = params[:longitude].to_f.round(2)
    clicked_city = City.find_by(latitude: latitude, longitude: longitude)
    @clicked_city_data = {name: clicked_city.name} # go through each variable I need and put in this hash
    respond_to do |format|
      format.js {render json: @clicked_city_data}
    end
  end
end
