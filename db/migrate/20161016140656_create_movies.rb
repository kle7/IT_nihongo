class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string        :name
      t.string        :content
      t.string        :image
      t.string        :year
      t.string        :actor

      t.timestamps null: false
    end
  end
end
