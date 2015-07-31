# #rails commands

# rails g model user email:string password_digest:string first_name:string last_name:string contact_number:string credit:float access_level:integer
# rails g model order payment_type:string is_canceled:boolean
# rails g model ticket is_canceled:boolean
# rails g model seat num:string
# rails g model price type:string price:float date_from:date date_to:date is_confirmed:boolean is_available:boolean
# rails g model show_time time_at:datetime is_confirmed:boolean is_canceled:boolean
# rails g model movie title:string tmdb_num:string tmdb_poster:string youtube_num:string runtime:integer date_from:date date_to:date is_confirmed:boolean is_canceled:boolean
# rails g model movie_type type:string
# rails g model theater name:string row_max_num:integer column_max_num:integer seats_array:text is_available:boolean date_from:date date_to:date
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
  ["1","20","S","1F,1G,1H,1I,1J,1K,1L,1M,1N,2A,2B,2C,2D,2F,2G,2H,2I,2J,2K,2L,2M,2N,2P,2Q,2R,2S,3A,3B,3C,3D,3F,3G,3H,3I,3J,3K,3L,3M,3N,3P,3Q,3R,3S,4A,4B,4C,4D,4F,4G,4H,4I,4J,4K,4L,4M,4N,4P,4Q,4R,4S,6A,6B,6C,6D,6F,6G,6H,6I,6J,6K,6L,6M,6N,6P,6Q,6R,6S,7A,7B,7C,7D,7F,7G,7H,7I,7J,7K,7L,7M,7N,7P,7Q,7R,7S,8A,8B,8C,8D,8F,8G,8H,8I,8J,8K,8L,8M,8N,8P,8Q,8R,8S,9A,9B,9C,9D,9F,9G,9H,9I,9J,9K,9L,9M,9N,9P,9Q,9R,9S,10A,10B,10C,10D,10F,10G,10H,10I,10J,10K,10L,10M,10N,10P,10Q,10R,10S,11A,11B,11C,11D,11F,11G,11H,11I,11J,11K,11L,11M,11N,11P,11Q,11R,11S,12A,12B,12C,12D,12F,12G,12H,12I,12J,12K,12L,12M,12N,12P,12Q,12R,12S,14A,14B,14C,14D,14F,14G,14H,14I,14J,14K,14L,14M,14N,14P,14Q,14R,14S,15A,15B,15C,15D,15F,15G,15H,15I,15J,15K,15L,15M,15N,15P,15Q,15R,15S,16A,16B,16C,16D,16F,16G,16H,16I,16J,16K,16L,16M,16N,16P,16Q,16R,16S,17A,17B,17C,17D,17F,17G,17H,17I,17J,17K,17L,17M,17N,17P,17Q,17R,17S,18A,18B,18C,18D,18F,18G,18H,18I,18J,18K,18L,18M,18N,18P,18Q,18R,18S,19A,19B,19C,19D,19F,19G,19H,19I,19J,19K,19L,19M,19N,19P,19Q,19R,19S,20A,20B,20C,20D,20F,20G,20H,20I,20J,20K,20L,20M,20N,20P,20Q,20R,20S"],
  ["2","18","Q","1F,1G,1H,1I,1J,1K,1L,2A,2B,2C,2D,2F,2G,2H,2I,2J,2K,2L,2N,2O,2P,2Q,3A,3B,3C,3D,3F,3G,3H,3I,3J,3K,3L,3N,3O,3P,3Q,4A,4B,4C,4D,4F,4G,4H,4I,4J,4K,4L,4N,4O,4P,4Q,6A,6B,6C,6D,6F,6G,6H,6I,6J,6K,6L,6N,6O,6P,6Q,7A,7B,7C,7D,7F,7G,7H,7I,7J,7K,7L,7N,7O,7P,7Q,8A,8B,8C,8D,8F,8G,8H,8I,8J,8K,8L,8N,8O,8P,8Q,9A,9B,9C,9D,9F,9G,9H,9I,9J,9K,9L,9N,9O,9P,9Q,10A,10B,10C,10D,10F,10G,10H,10I,10J,10K,10L,10N,10O,10P,10Q,11A,11B,11C,11D,11F,11G,11H,11I,11J,11K,11L,11N,11O,11P,11Q,12A,12B,12C,12D,12F,12G,12H,12I,12J,12K,12L,12N,12O,12P,12Q,14A,14B,14C,14D,14F,14G,14H,14I,14J,14K,14L,14N,14O,14P,14Q,15A,15B,15C,15D,15F,15G,15H,15I,15J,15K,15L,15N,15O,15P,15Q,16A,16B,16C,16D,16F,16G,16H,16I,16J,16K,16L,16N,16O,16P,16Q,17A,17B,17C,17D,17F,17G,17H,17I,17J,17K,17L,17N,17O,17P,17Q,18A,18B,18C,18D,18F,18G,18H,18I,18J,18K,18L,18N,18O,18P,18Q,"],
  ["3","17","Q","1F,1G,1H,1I,1J,1K,1L,2A,2B,2C,2D,2F,2G,2H,2I,2J,2K,2L,2N,2O,2P,2Q,3A,3B,3C,3D,3F,3G,3H,3I,3J,3K,3L,3N,3O,3P,3Q,4A,4B,4C,4D,4F,4G,4H,4I,4J,4K,4L,4N,4O,4P,4Q,6A,6B,6C,6D,6F,6G,6H,6I,6J,6K,6L,6N,6O,6P,6Q,7A,7B,7C,7D,7F,7G,7H,7I,7J,7K,7L,7N,7O,7P,7Q,8A,8B,8C,8D,8F,8G,8H,8I,8J,8K,8L,8N,8O,8P,8Q,9A,9B,9C,9D,9F,9G,9H,9I,9J,9K,9L,9N,9O,9P,9Q,10A,10B,10C,10D,10F,10G,10H,10I,10J,10K,10L,10N,10O,10P,10Q,11A,11B,11C,11D,11F,11G,11H,11I,11J,11K,11L,11N,11O,11P,11Q,12A,12B,12C,12D,12F,12G,12H,12I,12J,12K,12L,12N,12O,12P,12Q,14A,14B,14C,14D,14F,14G,14H,14I,14J,14K,14L,14N,14O,14P,14Q,15A,15B,15C,15D,15F,15G,15H,15I,15J,15K,15L,15N,15O,15P,15Q,16A,16B,16C,16D,16F,16G,16H,16I,16J,16K,16L,16N,16O,16P,16Q,17A,17B,17C,17D,17F,17G,17H,17I,17J,17K,17L,17N,17O,17P,17Q"],
  ["4","15","Q","1F,1G,1H,1I,1J,1K,1L,2A,2B,2C,2D,2F,2G,2H,2I,2J,2K,2L,2N,2O,2P,2Q,3A,3B,3C,3D,3F,3G,3H,3I,3J,3K,3L,3N,3O,3P,3Q,4A,4B,4C,4D,4F,4G,4H,4I,4J,4K,4L,4N,4O,4P,4Q,6A,6B,6C,6D,6F,6G,6H,6I,6J,6K,6L,6N,6O,6P,6Q,7A,7B,7C,7D,7F,7G,7H,7I,7J,7K,7L,7N,7O,7P,7Q,8A,8B,8C,8D,8F,8G,8H,8I,8J,8K,8L,8N,8O,8P,8Q,9A,9B,9C,9D,9F,9G,9H,9I,9J,9K,9L,9N,9O,9P,9Q,10A,10B,10C,10D,10F,10G,10H,10I,10J,10K,10L,10N,10O,10P,10Q,11A,11B,11C,11D,11F,11G,11H,11I,11J,11K,11L,11N,11O,11P,11Q,12A,12B,12C,12D,12F,12G,12H,12I,12J,12K,12L,12N,12O,12P,12Q,14A,14B,14C,14D,14F,14G,14H,14I,14J,14K,14L,14N,14O,14P,14Q,15A,15B,15C,15D,15F,15G,15H,15I,15J,15K,15L,15N,15O,15P,15Q"]
]
theaters.each do |theater|
  Theater.create(name:theater[0],row_max_num:theater[1],column_max_num:theater[2],seats_array:theater[3])
end


"1A,1B,1C,1D,1F,1G,1H,1I,1J,1K,1L,
2A,2B,2C,2D,2F,2G,2H,2I,2J,2K,2L,2N,2O,2P,2Q,
3A,3B,3C,3D,3F,3G,3H,3I,3J,3K,3L,3N,3O,3P,3Q,
4A,4B,4C,4D,4F,4G,4H,4I,4J,4K,4L,4N,4O,4P,4Q,
6A,6B,6C,6D,6F,6G,6H,6I,6J,6K,6L,6N,6O,6P,6Q,
7A,7B,7C,7D,7F,7G,7H,7I,7J,7K,7L,7N,7O,7P,7Q,
8A,8B,8C,8D,8F,8G,8H,8I,8J,8K,8L,8N,8O,8P,8Q,
9A,9B,9C,9D,9F,9G,9H,9I,9J,9K,9L,9N,9O,9P,9Q,
10A,10B,10C,10D,10F,10G,10H,10I,10J,10K,10L,10N,10O,10P,10Q,
11A,11B,11C,11D,11F,11G,11H,11I,11J,11K,11L,11N,11O,11P,11Q,
12A,12B,12C,12D,12F,12G,12H,12I,12J,12K,12L,12N,12O,12P,12Q,
14A,14B,14C,14D,14F,14G,14H,14I,14J,14K,14L,14N,14O,14P,14Q,
15A,15B,15C,15D,15F,15G,15H,15I,15J,15K,15L,15N,15O,15P,15Q,
16A,16B,16C,16D,16F,16G,16H,16I,16J,16K,16L,16N,16O,16P,16Q,
17A,17B,17C,17D,17F,17G,17H,17I,17J,17K,17L,17N,17O,17P,17Q,
18A,18B,18C,18D,18F,18G,18H,18I,18J,18K,18L,18N,18O,18P,18Q,"
