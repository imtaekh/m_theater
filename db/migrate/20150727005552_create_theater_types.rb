class CreateTheaterTypes < ActiveRecord::Migration
  def change
    create_table :theater_types do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
