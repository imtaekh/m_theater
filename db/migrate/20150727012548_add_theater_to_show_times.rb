class AddTheaterToShowTimes < ActiveRecord::Migration
  def change
    add_reference :show_times, :theater, index: true, foreign_key: true
  end
end
