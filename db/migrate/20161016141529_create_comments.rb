class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references    :movie, index: true
      t.references    :user, index: true
      t.string        :content

      t.timestamps null: false
    end
  end
end
