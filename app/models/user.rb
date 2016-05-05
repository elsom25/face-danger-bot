class User < ActiveRecord::Base
  def play_game!
    increment! :games_played
  end

  def lose_game!
    increment! :games_lost
  end

  def draw!
    increment! :draws
  end

  def safe_draws
    draws - games_lost
  end
end
