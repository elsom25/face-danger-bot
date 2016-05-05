module Responders
  class NewGame < ApplicationResponder
    def can_handle?
      match_message(Game.actions.begin_game) && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "New Game")
      chat_context.draws = 0
      chat_context.game = SecureRandom.uuid
      text_response("There's only #{pluralize(Game::DRAWS, 'straw')} left. Don't draw the short one!", [
        Game.actions.take_a_risk
      ])
    end
  end
end
