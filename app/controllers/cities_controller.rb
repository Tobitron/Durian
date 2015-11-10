class CitiesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @cities = City.all
    render json: @cities
  end

  def update
    latitude = params[:latitude].to_f.round(2)
    longitude = params[:longitude].to_f.round(2)
    @clicked_city = City.find_by(latitude: latitude, longitude: longitude)
    respond_to do |format|
      format.js
    end
  end
end
