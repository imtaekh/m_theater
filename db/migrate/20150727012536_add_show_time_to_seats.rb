class AddShowTimeToSeats < ActiveRecord::Migration
  def change
    add_reference :seats, :show_time, index: true, foreign_key: true
  end
end
