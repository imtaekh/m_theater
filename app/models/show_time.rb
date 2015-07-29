class ShowTime < ActiveRecord::Base
  has_one :movie
  belongs_to :movie
  has_one :theater
  belongs_to :theater
  has_many :seats
  has_many :movie_type, through: :movie
  has_many :theater_type, through: :theater
end
