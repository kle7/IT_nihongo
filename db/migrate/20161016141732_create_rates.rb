class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references    :movie, index: true
      t.references    :user, index: true
      t.integer       :vote
      t.timestamps null: false
    end
  end
end
