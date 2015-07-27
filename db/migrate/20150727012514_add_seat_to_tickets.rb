class AddSeatToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :seat, index: true, foreign_key: true
  end
end
