class ContentsController < ApplicationController
  def index
    @movies = Movie.all
    @seasons = Season.all

    # Create custom hashes for movies and seasons to include the type for sorting later
    @movies_with_type = @movies.map { |movie| { content: movie, type: 'Movie' } }
    @seasons_with_type = @seasons.map { |season| { content: season, type: 'Season' } }

    # Combine both arrays and sort based on the 'created_at' attribute
    @contents = (@movies_with_type + @seasons_with_type).sort_by { |c| c[:content].created_at }

    # Check the sort parameter and adjust the order accordingly
    if params[:sort] == "newest"
      @contents = @contents.reverse
    elsif params[:sort] == "oldest"
      @contents = @contents
    end
  end
end
