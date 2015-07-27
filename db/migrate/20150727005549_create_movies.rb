class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :tmdb_num
      t.string :youtube_num
      t.date :date_from
      t.date :date_to
      t.boolean :is_confirmed
      t.boolean :is_canceled

      t.timestamps null: false
    end
  end
end
