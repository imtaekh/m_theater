class Ticket < ActiveRecord::Base
  has_one :order
  has_one :price
  has_one :show_time
  belongs_to :order
  belongs_to :price
  belongs_to :show_time
  has_one :movie, through: :show_time
  has_many :theaters, through: :show_times
end
