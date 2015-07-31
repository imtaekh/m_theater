class AddSeatNumToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :seat_num, :string
  end
end
