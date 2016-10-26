class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @popular = Review.where(rating: 5)
  end
end
