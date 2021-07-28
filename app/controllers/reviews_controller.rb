class ReviewsController < ApplicationController
  before_action :find_review
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.surfboards = @surfboards
    @review.save
    redirect_to_ surfboards_path(@surfboards_show)
  end

  private

    # Find a surfboard
  def find_review
    @surfboards = Review.find(params[:surfboard_id])
  end

  def review_params
    params.require(:review).permit(:content, :photo)
  end
end
