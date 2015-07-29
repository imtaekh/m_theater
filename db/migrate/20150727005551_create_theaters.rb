class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.boolean :is_available
      t.integer :num_of_seats
      t.text :seats_array
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end
