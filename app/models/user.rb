class User < ActiveRecord::Base
  def play_game!
    increment! :games_played
  end

  def lose_game!
    increment! :games_lost
  end
end
