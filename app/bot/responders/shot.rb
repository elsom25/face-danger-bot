module Responders
  class Shot < ApplicationResponder
    include ActionView::Helpers::TextHelper
    ROUNDS = 6

    def can_handle?
      match_message(Action::TAKE_A_RISK) && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "Shot")

      register_game_play!

      shots = chat_context.shots.to_i
      random = Random.new(timestamp + chat_id)

      if random.rand(ROUNDS - shots).zero?
        chat_context.game = nil
        user.lose_game!
        reexecute_with(text_response("BAM! #{user.username} was shot! 😱"))
      else
        chat_context.shots = shots += 1
        reexecute_with(text_response("PHEW! #{user.username} has avoided face danger! Only #{pluralize(ROUNDS - shots, 'shot')} left!"))
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
