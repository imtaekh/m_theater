class ApplicationController < ActionController::Base
  $TMDB_API_KEY = ENV["TMDB_API_KEY"]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

end
