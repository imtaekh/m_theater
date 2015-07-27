class ShowTime < ActiveRecord::Base
  has_one :movie
  has_one :theater
  has_many :movie_type, through: :movie
  has_many :theater_type, through: :theater
end
