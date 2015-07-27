class Ticket < ActiveRecord::Base
  has_one :order
  has_one :seat
  has_one :price
  has_many :show_times, through: :seats
  has_many :movies, through: :show_times
  has_many :theaters, through: :show_times
end
