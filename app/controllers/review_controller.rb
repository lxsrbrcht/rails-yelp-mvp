class ReviewController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
  end
end
