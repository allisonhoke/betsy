class HomeController < ApplicationController

  def index
    @popular = Review.where(rating: 5)
  end
end
