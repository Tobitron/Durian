class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @latest_city_id = City.last.id
    @cities_array = City.cities_alphabetized
    @cities_array.unshift(['Select Ciy', nil])
  end

  def create
    # TODO it seems weird to repeate these instance variables, must be a DRY way to do this
    @latest_city_id = City.last.id
    @cities_array = City.cities_alphabetized
    @cities_array.unshift(['Select Ciy', nil])

    @review = Review.new(review_params)
    @review.user_id = current_user.id
    city = City.find_by(id: params[:review][:city_id])
    if @review.save
      # TODO below code can't be good
      @review.review_average = @review.calc_review_average
      @review.save
      flash[:success] = "Review created! Write another one?"
      city.city_review_average = city.calc_city_review_average
      city.save # TODO This should be in the model
      redirect_to new_review_path
    else
      flash[:warning] = @review.errors.full_messages
      render :new
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
