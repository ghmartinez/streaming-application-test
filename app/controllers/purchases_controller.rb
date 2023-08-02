class PurchasesController < ApplicationController
  def create
    if params[:movie_id].present?
      purchase_movie
    elsif params[:season_id].present?
      purchase_season
    else
      redirect_to contents_path, alert: 'Invalid purchase request.'
    end
  end

  private

  def purchase_movie
    @movie = Movie.find(params[:movie_id])
    purchase_content(@movie)
  end

  def purchase_season
    @season = Season.find(params[:season_id])
    purchase_content(@season)
  end

  def purchase_content(content)
    @purchase_option = PurchaseOption.new(price: 2.99, content: content, video_quality: params[:purchase_option_id])
    if @purchase_option.save
      @purchase = Purchase.new(user: current_user, purchase_option: @purchase_option)
      if @purchase.save
        redirect_to contents_path, notice: 'Purchase was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
end
