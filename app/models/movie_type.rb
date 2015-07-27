class MovieType < ActiveRecord::Base
  has_and_belongs_to_many :movie
  has_many :show_times, through: :movies
  has_many :seats, through: :show_times
  has_many :tickets, through: :seats
end
