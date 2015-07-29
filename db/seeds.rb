# #rails commands

# rails g model user email:string password_digest:string first_name:string last_name:string contact_number:string credit:float access_level:integer
# rails g model order payment_type:string is_canceled:boolean
# rails g model ticket is_canceled:boolean
# rails g model seat num:string
# rails g model price type:string price:float date_from:date date_to:date is_confirmed:boolean is_available:boolean
# rails g model show_time time_at:datetime is_confirmed:boolean is_canceled:boolean
# rails g model movie title:string tmdb_num:string tmdb_poster:string youtube_num:string runtime:integer date_from:date date_to:date is_confirmed:boolean is_canceled:boolean
# rails g model movie_type type:string
# rails g model theater name:string num_of_seats:integer seats_array:text is_available:boolean date_from:date date_to:date
# rails g model theater_type type:string
# rails g migration add_user_to_orders user:references
# rails g migration add_order_to_tickets order:references
# rails g migration add_seat_to_tickets seat:references
# rails g migration add_price_to_tickets price:references
# rails g migration add_ticket_to_seats ticket:references
# rails g migration add_show_time_to_seats show_time:references
# rails g migration add_movie_to_show_times movie:references
# rails g migration add_theater_to_show_times theater:references
# rails g migration create_join_table_movies_movie_types movies movie_types
# rails g migration create_join_table_theaters_theater_types theaters theater_types


# #models

# class User < ActiveRecord::Base
#   has_secure_password
#   validates :email, presence: true, uniqueness: true
#   validates :first_name, presence: true
#   has_many :orders
# end
#
# class Order < ActiveRecord::Base
#   has_one :user
#   has_many :tickets
#   has_many :seats, through: :tickets
#   has_many :show_times, through: :seats
#   has_many :movies, through: :show_times
#   has_many :theaters, through: :show_times
# end
#
# class Ticket < ActiveRecord::Base
#   has_one :order
#   has_one :seat
#   has_one :price
#   has_many :show_times, through: :seats
#   has_many :movies, through: :show_times
#   has_many :theaters, through: :show_times
# end
#
# class Seat < ActiveRecord::Base
#   has_one :ticket
#   has_one :show_time
#   has_one :movie, through: :show_time
#   has_one :theater, through: :show_time
# end
#
# class Show_time < ActiveRecord::Base
#   has_one :movie
#   has_one :theater
#   has_many :movie_type, through: :movie
#   has_many :theater_type, through: :theater
# end
#
# class Movie < ActiveRecord::Base
#   has_many :show_times
#   has_and_belongs_to_many :movie_types
#   has_many :seats, through: :show_times
#   has_many :tickets, through: :seats
# end
#
# class Movie_type < ActiveRecord::Base
#   has_and_belongs_to_many :movie
#   has_many :show_times, through: :movies
#   has_many :seats, through: :show_times
#   has_many :tickets, through: :seats
# end
#
# class Theater < ActiveRecord::Base
#   has_many :show_times
#   has_and_belongs_to_many :theater_types
#   has_many :seats, through: :show_times
#   has_many :tickets, through: :seats
# end
#
# class Theater_type < ActiveRecord::Base
#   has_and_belongs_to_many :theater
# end

# user=User.new
# user.email="admin@mtheater.com"
# user.password="admin"
# user.first_name="admin"
# user.access_level=10
# user.save
#
# names = ["Addison", "Ben", "Christine", "Chloe", "Cris", "Dane", "David", "Emily", "Imtaek", "Jack", "Jesse", "Jonathan", "Pericles", "Peter", "Philippe", "Sergio", "Simon", "Tali", "Tavo", "Trevor"]
# names.each do |name|
#   user=User.new
#   user.email="#{name}@mtheater.com"
#   user.password="#{name}"
#   user.first_name="#{name}"
#   user.access_level=0
#   user.save
# end

movies = [
  ["Jurassic World","135397","lP-sUUUfamw",-50],
  ["Minions","211672","eisKxhjBnZ0",-5],
  ["Ant-Man","102899","pWdKf3MneyI",-10],
  ["Terminator Genisys","87101","je73b_9JdR0",-15],
  ["Ted 2","214756","S3AVcCggRnU",5],
  ["Inside Out","150540","_MC3XuMvsDI",10],
  ["Pixels","257344","XAHprLW48no",15]
]
movies.each do |movie|
  today = Date.today
  data = HTTParty.get "https://api.themoviedb.org/3/movie/#{movie[1]}?api_key=#{$TMDB_API_KEY}"
  Movie.create(title:movie[0],tmdb_num:movie[1],youtube_num:movie[2],tmdb_poster:data["poster_path"],runtime:data["runtime"],date_from:today+movie[3],date_to:today+movie[3]+30)
end
theaters=[
  ["1","1A,1B,1C,1D,1E,1F,1G,2A,2B,2C,2D,2E,2F,2G,3A,3B,3C,3D,3E,3F,3G,4A,4B,4C,4D,4E,4F,4G"],
  ["2","1A,1B,1C,1D,1E,1F,1G,2A,2B,2C,2D,2E,2F,2G,3A,3B,3C,3D,3E,3F,3G"],
  ["3","1A,1B,1C,1D,1E,1F,2A,2B,2C,2D,2E,2F,3A,3B,3C,3D,3E,3F,4A,4B,4C,4D,4E,4F"],
  ["4","1A,1B,1C,1D,1E,1F,2A,2B,2C,2D,2E,2F,3A,3B,3C,3D,3E,3F"]
]
theaters.each do |theater|
  Theater.create(name:theater[0],seats_array:theater[1])
end
