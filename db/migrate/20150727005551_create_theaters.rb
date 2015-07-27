class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :num_of_seats
      t.text :seats_arry
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end
