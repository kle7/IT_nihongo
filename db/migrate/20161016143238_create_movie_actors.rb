class CreateMovieActors < ActiveRecord::Migration
  def change
    create_table :movie_actors do |t|
      t.integer :movie_id
      t.integer :actor_id

      t.timestamps null: false
    end
  end
end
