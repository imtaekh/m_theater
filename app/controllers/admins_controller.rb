class AdminsController < ApplicationController
  def movies
    @movies=Movie.order('title ASC')
    @movie=Movie.new
  end

  def manage
  end

  def statistics
  end

  def orders
  end
end
