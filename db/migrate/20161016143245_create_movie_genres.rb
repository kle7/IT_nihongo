class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
      t.references    :movie, index: true
      t.references    :genre, index: true

      t.timestamps null: false
    end
  end
end
