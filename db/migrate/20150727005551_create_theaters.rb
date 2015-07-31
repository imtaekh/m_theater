class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :row_max_num
      t.integer :column_max_num
      t.text :seats_array
      t.boolean :is_available
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end
