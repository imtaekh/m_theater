class Movie < ActiveRecord::Base
  has_many :show_times
  has_and_belongs_to_many :movie_types
  has_many :seats, through: :show_times
  has_many :tickets, through: :seats
end
