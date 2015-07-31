class AddShowTimeToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :show_time, index: true, foreign_key: true
  end
end
