class ReviewsController < ApplicationController

before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie),
                    notice: "Thanks for your review!"
    else
      render :new
    end
  end
end

private

def review_params
  params.require(:review).permit(:name, :stars, :comment)
end

def set_movie
  @movie = Movie.find_by(params[:movie_id])
end