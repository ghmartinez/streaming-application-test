class PurchaseOptionsController < ApplicationController
  def index
    puts "params[:movie_id]: #{params[:movie_id]}"
    raise
    @movie = Movie.find(params[:movie_id])
    @purchase_options = PurchaseOption.new(movie: @movie, price: 2.99)
  end
end
