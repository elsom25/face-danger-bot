class AddGameCountsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :games_played, :int, default: 0, null: false
    add_column :users, :games_lost,   :int, default: 0, null: false
  end
end
