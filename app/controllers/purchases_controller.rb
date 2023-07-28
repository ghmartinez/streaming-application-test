class PurchasesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @purchase_options = @movie.purchase_options

    @purchase = current_user.purchases.new(purchase_params)

    if @purchase_options.any? && @purchase.save
      redirect_to @movie, notice: 'Purchase successful!'
    else
      redirect_to @movie, alert: 'Purchase failed!'
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:purchase_option_id)
  end
end
