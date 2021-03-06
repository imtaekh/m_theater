class TicketsController < ApplicationController
  before_action :authenticate

  $period=7
  def choose_movie_or_date
    @date_from=Time.now+3600
    @date_to=Date.today+$period
    @show_times=ShowTime.where("time_at >= '#{@date_from.year}-#{@date_from.mon}-#{@date_from.day} #{@date_from.hour}:#{@date_from.min}' and time_at <= '#{@date_to.year}-#{@date_to.mon}-#{@date_to.day} 24:00'")
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
      @date_from=time_now+3600
    else
      @date_from=Time.new(date_componant[0],date_componant[1],date_componant[2])
    end
    @date_at=Time.new(date_componant[0],date_componant[1],date_componant[2])
    @show_times=ShowTime.where("time_at >= '#{@date_from.year}-#{@date_from.mon}-#{@date_from.day} #{@date_from.hour}:#{@date_from.min}' and time_at <= '#{@date_at.year}-#{@date_at.mon}-#{@date_at.day} 24:00'")
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
    @show_times=ShowTime.where("time_at >= '#{@date_from.year}-#{@date_from.mon}-#{@date_from.day} #{@date_from.hour}:#{@date_from.min}' and time_at <= '#{@date_to.year}-#{@date_to.mon}-#{@date_to.day} 24:00' and movie_id = '#{params[:movie_id]}'")
    redirect_to buy_ticket_step1_path, notice:"This Movie is not available yet" if @show_times.count==0;
    @show_times=@show_times.sort_by{|hash| hash[:time_at]}
  end

  def choose_seats
    @show_time=ShowTime.find(params[:show_time_id])
    @theater=@show_time.theater
  end

  def create
    @show_time=ShowTime.find(params["show_time_id"])
    @theater=@show_time.theater
    ticket_string=params["ticket_array"]
    @ticket_array=ticket_string.split(/,/)
    if @ticket_array.length == 0
      flash.now.alert ="No selected seats. Please choose seats!"
      render :choose_seats
      return
    end
    @ticket_array.each do |seat_num|
      if @show_time.tickets.find_by(seat_num: seat_num)
        flash.now.alert ="Seats are taken. Please choose different seats!"
        render :choose_seats
        return
      end
    end
    @order=Order.create()
    @ticket_array.each do |seat_num|
      t=Ticket.create(seat_num:seat_num,show_time_id:@show_time.id)
      @order.tickets << t
    end
    current_user.orders << @order
  end
end
#s=ShowTime.where("time_at >= '2015-7-30 12:00' and time_at <= '2015-7-31 24:00' and movie_id = '3'")
