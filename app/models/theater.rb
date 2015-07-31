class Theater < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :show_times
  has_and_belongs_to_many :theater_types
  has_many :tickets, through: :show_times
end
