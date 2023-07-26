class SeasonsController < ApplicationController
  def index
    @seasons = Season.all

    # Check the sort parameter and adjust the order accordingly
    if params[:sort] == "newest"
      @seasons = @seasons.order(created_at: :desc)
    elsif params[:sort] == "oldest"
      @seasons = @seasons.order(created_at: :asc)
    end
  end

  def show
    @season = Season.find(params[:id])
  end
end
