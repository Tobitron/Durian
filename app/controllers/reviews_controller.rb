class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @cities_array = City.cities_alphabetized
    @latest_city_id = City.last.id
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    city = City.find_by(id: params[:review][:city_id])
    @review.review_average = @review.calc_review_average
    if @review.save
      flash[:success] = "Review created! Write another one?"
      city.city_review_average = city.calc_city_review_average
      city.save # TODO This should be in the model
      redirect_to new_review_path
    else
      flash[:warning] = @review.errors.full_messages[0]
      redirect_to new_review_path
    end
  end

  def update
    # use the review id to find the user it belongs to, create an instant variable, pass this to bias card partial
    @biased_user = User.find(params[:id])
    respond_to do |format|
      format.js {render :partial => 'bias_card'}
    end
  end

  def info
  end

  protected
    def review_params
      params.require(:review).permit(:city_id, :description, :value, :beauty, :activities, :friendliness, :food, :touristy)
    end
end
