class AddTicketToSeats < ActiveRecord::Migration
  def change
    add_reference :seats, :ticket, index: true, foreign_key: true
  end
end
