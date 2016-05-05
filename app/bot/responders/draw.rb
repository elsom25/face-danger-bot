module Responders
  class Draw < ApplicationResponder
    def can_handle?
      match_message(Game.actions.take_a_risk) && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "Draw")

      register_game_play!
      user.draw!

      draws = chat_context.draws.to_i
      random = Random.new(timestamp + chat_id)

      if random.rand(Game::DRAWS - draws).zero?
        chat_context.game = nil
        user.lose_game!
        reexecute_with(text_response("OMG! #{user.username} #{Game.bad_thing}"))
      else
        chat_context.draws = draws += 1
        reexecute_with(text_response("PHEW! #{user.username} has avoided face danger! Only #{pluralize(Game::DRAWS - draws, 'draw')} left!"))
      end
    end

  protected

    def register_game_play!
      user_games = user_context.games || []
      if !user_games.include? chat_context.game
        user_games << chat_context.game
        user_context.games = user_games.to_json
        user.play_game!
      end
    end
  end
end
