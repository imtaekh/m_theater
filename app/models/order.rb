class Order < ActiveRecord::Base
  has_one :user
  has_many :tickets
  has_many :seats, through: :tickets
  has_many :show_times, through: :seats
  has_many :movies, through: :show_times
  has_many :theaters, through: :show_times
end
