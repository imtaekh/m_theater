class ShowTimesController < ApplicationController
  def confirm_create_by_movie
    @movie_id = Movie.find(params[:movie_id])
    @theater =  Theater.find_by(name:params[:theater])

    @new_show_times =[]

    dates=params[:dates].split(/,/)
    dates.each do |date_string|
      unless params[date_string.to_sym] == ""
        hash={date_string.to_sym=>[]}
        date_componants=date_string.split("-")
        time_raw=params[date_string.to_sym].split(/,/)
        time_array=[]
        time_raw.each do |time_string|
          time_componants=time_string.split(":")
          time_array.push Time.new(date_componants[0].to_i,date_componants[1].to_i,date_componants[2].to_i,time_componants[0].to_i,time_componants[1].to_i,0,"+00:00")
        end
        hash[date_string.to_sym]=time_array
        @new_show_times.push hash
      end # end for unless
    end # end for date.each
    p @cur_show_time = ShowTime.where("time_at >= '#{dates[0]}' and time_at <= '#{dates[-1]}' and theater_id = #{@theater.id}")
    @cur_show_time.each do |cur|
      cur.movie.title
      cur.movie.runtime
      cur.time_at
    end
  end # end for action
end # end for Controller
