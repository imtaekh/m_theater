class AdminsController < ApplicationController
  def movies
    @movies=Movie.order('title ASC')
    @movie=Movie.new
  end

  def show_times
    @today=Date.today
    @movies=Movie.order('title ASC')
    @theaters=Theater.order('name ASC')
    @movie=Movie.new
    @show_times=ShowTime.order('movie_id.title ASC')
    @show_time=ShowTime.new
  end

  def manage
  end

  def statistics
  end

  def orders
  end
end
