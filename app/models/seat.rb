class Seat < ActiveRecord::Base
  has_one :ticket
  has_one :show_time
  belongs_to :ticket
  belongs_to :show_time
  has_one :movie, through: :show_time
  has_one :theater, through: :show_time
end
