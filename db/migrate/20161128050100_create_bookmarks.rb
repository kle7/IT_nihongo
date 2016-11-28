class CreateBookmarks < ActiveRecord::Migration[5.0]
  def up
    create_table :bookmarks, id:false do |t|
    t.integer :movie_id, null: false
    t.integer :user_id, null: false
    t.timestamps
    end
    add_index :bookmarks, [:movie_id,:user_id], unique: true
  end
  def down
    drop_table :bookmarks
  end
end
