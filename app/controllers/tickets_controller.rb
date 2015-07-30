class TicketsController < ApplicationController
  $period=7
  def choose_movie_or_date
    @date_from=Time.now
    @date_to=Date.today+$period
    @show_times=ShowTime.where("time_at >= '#{@date_from.year}-#{@date_from.mon}-#{@date_from.day} #{@date_from.hour+1}:#{@date_from.min}' and time_at <= '#{@date_to.year}-#{@date_to.mon}-#{@date_to.day} 24:00'")
    @movie_array=[]

    @show_times.each do |show_time|
      @movie_array.push show_time.movie
    end
      @movie_array.uniq!
  end

  def choose_movie
    redirect_to buy_ticket_step1_path unless params[:date]
    date_componant=params[:date].split("-")
    time_now=Time.now
    if (date_componant[0].to_i == time_now.year && date_componant[1].to_i == time_now.mon && date_componant[2].to_i == time_now.day )
      @date_at=time_now
    else
      @date_at=Time.new(date_componant[0],date_componant[1],date_componant[2])
    end
    @show_times=ShowTime.where("time_at >= '#{@date_at.year}-#{@date_at.mon}-#{@date_at.day} #{@date_at.hour+1}:#{@date_at.min}' and time_at <= '#{@date_at.year}-#{@date_at.mon}-#{@date_at.day} 24:00'")
    @movie_array=[]

    @show_times.each do |show_time|
      @movie_array.push show_time.movie
    end

    @movie_array.uniq!
    @show_times=@show_times.sort_by{|hash| hash[:time_at]}
  end

  def choose_date
    redirect_to buy_ticket_step1_path unless params[:movie_id]
    @movie=Movie.find(params[:movie_id])
    @dates_array=[]

    @date_from=Time.now
    @date_to=Date.today+$period
    @show_times=ShowTime.where("time_at >= '#{@date_from.year}-#{@date_from.mon}-#{@date_from.day} #{@date_from.hour+1}:#{@date_from.min}' and time_at <= '#{@date_to.year}-#{@date_to.mon}-#{@date_to.day} 24:00' and movie_id = '#{params[:movie_id]}'")
    redirect_to buy_ticket_step1_path, notice:"This Movie is not available yet" if @show_times.count==0;
    @show_times=@show_times.sort_by{|hash| hash[:time_at]}
  end

  def choose_seats
  end

  def create
  end
end
#s=ShowTime.where("time_at >= '2015-7-30 12:00' and time_at <= '2015-7-31 24:00' and movie_id = '3'")
