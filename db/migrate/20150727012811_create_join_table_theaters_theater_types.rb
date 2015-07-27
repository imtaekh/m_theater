class CreateJoinTableTheatersTheaterTypes < ActiveRecord::Migration
  def change
    create_join_table :theaters, :theater_types do |t|
      t.index [:theater_id, :theater_type_id]
      t.index [:theater_type_id, :theater_id]
    end
  end
end
