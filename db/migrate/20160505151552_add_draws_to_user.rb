class AddDrawsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :draws, :int, default: 0, null: false
  end
end
