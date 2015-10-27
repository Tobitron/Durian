class ReviewsController < ApplicationController
  def index
    # This should be in the city controller
    @reviews = Review.all
    respond_to do |format|
      format.json { render json: @reviews}
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(tour_params)
    if @review.save
      flash[:success] = "Review created! Write another one?"
      redirect_to new_review_path
    else
      render 'new'
    end
  end

  protected
    def tour_params
      params.require(:review).permit(:city_id, :description, :value, :beauty, :activities, :friendliness, :food, :touristy)
    end
end
