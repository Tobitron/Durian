class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    latitude = params[:latitude].to_f.round(2)
    longitude = params[:longitude].to_f.round(2)
    # This variable gets updated by an ajax request when someone clicks on a Google maps marker.
    # But how does my view know that it's been updated??
    @clicked_city = City.find_by(latitude: latitude, longitude: longitude)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(tour_params)
    city = City.find_by(id: params[:review][:city_id])
    @review.review_average = @review.calc_review_average
    if @review.save
      flash[:success] = "Review created! Write another one?"
      city.city_review_average = city.calc_city_review_average
      city.save # This should be in the model and it could blow up the app if it fails, other than that great job me!
      redirect_to new_review_path
    else
      render 'new'
    end
  end

  def show

  end

  protected
    def tour_params
      params.require(:review).permit(:city_id, :description, :value, :beauty, :activities, :friendliness, :food, :touristy)
    end
end
