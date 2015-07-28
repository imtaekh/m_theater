class MoviesController < ApplicationController
  def index
  end

  def show
    @movie=Movie.find(params[:id])
      @data = HTTParty.get "https://api.themoviedb.org/3/movie/#{@movie.tmdb_num}?api_key=#{$TMDB_API_KEY}"
  end

  def create
    data = HTTParty.get "https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_num]}?api_key=#{$TMDB_API_KEY}"
    @movie = Movie.new(movie_params)
    @movie.title=data["original_title"]
    @movie.tmdb_poster=data["poster_path"]
    if @movie.save
      redirect_to admins_movies_path, notice: 'Movie was successfully created.'
    else
      render :edit
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admins_movies_path, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admins_movies_path, notice: 'Movie was successfully destroyed.'
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :tmdb_num,:youtube_num,:date_to, :date_from)
  end
end
