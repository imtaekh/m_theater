class RenameColumnSeatsArryToSeatsArrayOnTheater < ActiveRecord::Migration
  def change
    rename_column :theaters, :seats_arry, :seats_array
  end
end
