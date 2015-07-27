class AddPriceToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :price, index: true, foreign_key: true
  end
end
