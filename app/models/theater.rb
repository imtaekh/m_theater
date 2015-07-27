class Theater < ActiveRecord::Base
  has_many :show_times
  has_and_belongs_to_many :theater_types
  has_many :seats, through: :show_times
  has_many :tickets, through: :seats
end
