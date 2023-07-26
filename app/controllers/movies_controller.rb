class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    # Check the sort parameter and adjust the order accordingly
    if params[:sort] == "newest"
      @movies = @movies.order(created_at: :desc)
    elsif params[:sort] == "oldest"
      @movies = @movies.order(created_at: :asc)
    end
  end

  def show
    @movie = Movie.find_by(id: params[:id])
  end
end
