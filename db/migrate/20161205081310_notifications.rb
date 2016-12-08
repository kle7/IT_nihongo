class Notifications < ActiveRecord::Migration[5.0]
  def up
    create_table :notifications do |t|
    t.integer :reciver_id, null: false
    t.integer :sender_id, null: false
    t.string :link, null: false
    t.string :content, null: false
    t.integer :sender_status, null: false
    t.integer :reciver_status, null: false
    t.timestamps
    end
  end
  def down
    drop_table :notifications
  end
end
