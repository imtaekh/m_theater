class HomeController < ApplicationController
  def index
    @today=Date.today
    @movies=Movie.where("date_to > '#{@today}' or date_to is null")
    @playing_now=@movies.select do |movie|
      movie.date_from <= @today
    end
    @playing_now.sort_by!{|h| h[:date_from]}.reverse!
    @comming_soon=@movies.select do |movie|
      movie.date_from > @today
    end
    @comming_soon.sort_by!{|h| h[:date_from]}
  end
end
