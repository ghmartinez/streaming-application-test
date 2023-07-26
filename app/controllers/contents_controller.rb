class ContentsController < ApplicationController
  def index
    @movies = Movie.all
    @seasons = Season.all
    @contents = @movies + @seasons

    # Check the sort parameter and adjust the order accordingly
    if params[:sort] == "newest"
      @contents = @contents.order(created_at: :desc)
    elsif params[:sort] == "oldest"
      @contents = @contents.order(created_at: :asc)
    end
  end
end
