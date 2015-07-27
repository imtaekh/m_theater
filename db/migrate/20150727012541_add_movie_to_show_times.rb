class AddMovieToShowTimes < ActiveRecord::Migration
  def change
    add_reference :show_times, :movie, index: true, foreign_key: true
  end
end
