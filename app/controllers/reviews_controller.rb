class ReviewsController < ApplicationController
  def index
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
