class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.string :num

      t.timestamps null: false
    end
  end
end
