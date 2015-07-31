class AdminsController < ApplicationController
  before_action :admin_only

  def movies
    @movies=Movie.order('title ASC')
    @movie=Movie.new
    @today=Date.today
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
