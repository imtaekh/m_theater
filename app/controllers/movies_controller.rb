class MoviesController < ApplicationController
  before_action :authenticate, except: [:index, :show ]

  $TMDB_API_KEY = ENV["TMDB_API_KEY"]

  def index
    @today = Date.today
    @movies = Movie.where("date_to > '#{@today}' or date_to is null")

    @playing_now = @movies.select do |movie|
      movie.date_from <= @today
    end

    @playing_now.sort_by!{|h| h[:date_from]}.reverse!

    @comming_soon = @movies.select do |movie|
      movie.date_from > @today
    end

    @comming_soon.sort_by!{|h| h[:date_from]}
  end

  def show
    @movie=Movie.find(params[:id])
    @movie_data = HTTParty.get "https://api.themoviedb.org/3/movie/#{@movie.tmdb_num}?api_key=#{$TMDB_API_KEY}"
    @movie_images_data = HTTParty.get "https://api.themoviedb.org/3/movie/#{@movie.tmdb_num}/images?api_key=#{$TMDB_API_KEY}"
    @movie_casts_data = HTTParty.get "https://api.themoviedb.org/3/movie/#{@movie.tmdb_num}/casts?api_key=#{$TMDB_API_KEY}"
  end

  def create
    data = HTTParty.get "https://api.themoviedb.org/3/movie/#{movie_params[:tmdb_num]}?api_key=#{$TMDB_API_KEY}"
    @movie = Movie.new(movie_params)
    @movie.title=data["original_title"]
    @movie.tmdb_poster=data["poster_path"]
    @movie.runtime=data["runtime"]
    if @movie.save
      redirect_to admins_movies_path, notice: 'Movie was successfully created.'
    else
      redirect_to admins_movies_path, notice: 'Failed to create a movie'
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
