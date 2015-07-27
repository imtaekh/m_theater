class CreateJoinTableMoviesMovieTypes < ActiveRecord::Migration
  def change
    create_join_table :movies, :movie_types do |t|
      t.index [:movie_id, :movie_type_id]
      t.index [:movie_type_id, :movie_id]
    end
  end
end
