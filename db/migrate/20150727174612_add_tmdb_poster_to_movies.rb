class AddTmdbPosterToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :tmdb_poster, :string
  end
end
