class Movie < ActiveRecord::Base
  validates :tmdb_num, presence: true
  validates :date_from, presence: true

  has_many :show_times
  has_and_belongs_to_many :movie_types
  has_many :tickets, through: :show_times
end
