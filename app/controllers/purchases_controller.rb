class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    @movie = Movie.find(params[:movie_id])
    @purchase = @movie.purchases.new(user_id: current_user.id)

    if @purchase.save
      redirect_to movie_path(@movie), notice: 'Purchase was successful.'
    else
      redirect_to movie_path(@movie), alert: 'Failed to create a purchase.'
    end
  end
end
