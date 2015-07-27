class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.date :date_on
      t.time :time_at
      t.boolean :is_confirmed
      t.boolean :is_canceled

      t.timestamps null: false
    end
  end
end
