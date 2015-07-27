class AdminsController < ApplicationController
  def movies
    @movies=Movie.all
  end

  def manage
  end

  def statistics
  end

  def orders
  end
end
