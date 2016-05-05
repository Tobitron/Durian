class CitiesController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @cities = City.all
    render json: @cities
  end

  def create
    latitude = params[:latitude].to_f.round(4)
    longitude = params[:longitude].to_f.round(4)
    name = params[:name]
    city = City.new(name: name, latitude: latitude, longitude: longitude)
    if city.save
      flash[:success] = "City created! Please refresh."
      redirect_to new_review_path
    else
      flash[:notice] = "Your city couldn't be created."
      redirect_to new_review_path
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

  protected
    def city_params
      #TODO explore if I can incorporate strong params with ajax call to #create or need to switch to Geocoder gem
      params.require(:city).permit(:name, :latitude, :longitude)
    end
end
