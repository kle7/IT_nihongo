class CreateMovieActors < ActiveRecord::Migration
  def change
    create_table :movie_actors do |t|
      t.references    :movie, index: true
      t.references    :actor, index: true

      t.timestamps null: false
    end
  end
end
