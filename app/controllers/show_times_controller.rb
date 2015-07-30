class ShowTimesController < ApplicationController
  def check_create_by_movie
    @movie = Movie.find(params[:movie_id])
    @theater = Theater.find_by(name:params[:theater])
    @padding_time = 30
    @show_times_array =[]

    if params["check"]
      dates=params[:dates].split(/,/)
      dates.each do |date_string|
        unless params[date_string.to_sym] == ""
          outer_hash={}
          date_componants=date_string.split("-")
          time_raw=params[date_string.to_sym].gsub(/[ ,]/, ',').split(",").select{|x| x.length>0}
          time_array=[]
          time_raw.each do |time_string|
            time_componants=time_string.split(":")
            inner_hash={}
            inner_hash[:show_time]=Time.new(date_componants[0].to_i,date_componants[1].to_i,date_componants[2].to_i,time_componants[0].to_i,time_componants[1].to_i,0,"+00:00")
            inner_hash[:movie_id]=params[:movie_id]
            inner_hash[:movie_title]=@movie.title
            inner_hash[:runtime]=@movie.runtime
            inner_hash[:is_new]=true
            time_array.push inner_hash
          end
          outer_hash[date_string.to_sym]=time_array
          @show_times_array.push outer_hash
        end # end for unless
      end # end for date.each

      cur_show_times = ShowTime.where("time_at >= '#{dates[0]} 00:00' and time_at <= '#{dates[-1]} 24:00' and theater_id = #{@theater.id}")
      cur_show_times.each do |cur|
        for i in 0...@show_times_array.length
          cur.time_at.strftime("%Y-%m-%d").to_sym
          if cur.time_at.strftime("%Y-%m-%d").to_sym == @show_times_array[i].keys[0]
            inner_hash={}
            inner_hash[:show_time]=cur.time_at
            inner_hash[:movie_id]=cur.movie.id
            inner_hash[:movie_title]=cur.movie.title
            inner_hash[:runtime]=cur.movie.runtime
            inner_hash[:is_new]=false
            @show_times_array[i][@show_times_array[i].keys[0]].push inner_hash
          end
        end # end for for
      end # end for cur_show_times.each

      for i in 0...@show_times_array.length
        p @show_times_array[i][@show_times_array[i].keys[0]].sort_by!{|hash|hash[:show_time]}
      end
    elsif params["create"]

      dates=params[:dates].split(/,/)
      dates.each do |date_string|
        unless params[date_string.to_sym] == ""
          outer_hash={}
          date_componants=date_string.split("-")
          time_raw=params[date_string.to_sym].gsub(/[ ,]/, ',').split(",").select{|x| x.length>0}
          time_array=[]
          time_raw.each do |time_string|
            time_componants=time_string.split(":")
            inner_hash={}
            inner_hash[:show_time]=Time.new(date_componants[0].to_i,date_componants[1].to_i,date_componants[2].to_i,time_componants[0].to_i,time_componants[1].to_i,0,"+00:00")
            inner_hash[:movie_id]=params[:movie_id]
            inner_hash[:movie_title]=@movie.title
            inner_hash[:runtime]=@movie.runtime
            inner_hash[:is_new]=true
            time_array.push inner_hash
          end
          outer_hash[date_string.to_sym]=time_array
          @show_times_array.push outer_hash
        end # end for unless
      end # end for date.each

      for i in 0...@show_times_array.length
        @show_times_array[i][@show_times_array[i].keys[0]].each do |time|
          show_time=ShowTime.create(time_at:time[:show_time],movie_id:@movie.id,theater_id:@theater.id)
          p show_time
          p seats_array=show_time.theater.seats_array.split(",")
          puts
          seats_array.each do |seat|
            s=Seat.create(num:seat,show_time_id:show_time.id)
            p s
          end
        end
      end # end for for
      redirect_to admins_show_times_path, notice: "Show times succefully created"
    else # else for if params["check"]
      redirect_to root_path
    end # end for if params["check"]
  end # end for action

  def create_by_movie
  end

end # end for Controller
