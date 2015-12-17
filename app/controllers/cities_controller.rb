class CitiesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @cities = City.all
    render json: @cities
  end

  def create
    latitude = params[:latitude]
    longitude = params[:longitude]
    name = params[:name]
    city = City.new(name: name, latitude: latitude, longitude: longitude)
    if city.save
      redirect_to root_path
    else
      flash[:notice] = "Your city couldn't be created"
    end
  end

  def popup
    latitude = params[:latitude].to_f.round(4)
    longitude = params[:longitude].to_f.round(4)
    @clicked_city = City.find_by(latitude: latitude, longitude: longitude)
    respond_to do |format|
      format.js {render :partial => 'popup'}
    end
  end
end
