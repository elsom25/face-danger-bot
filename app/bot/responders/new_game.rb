module Responders
  class NewGame < ApplicationResponder
    def can_handle?
      match_message(Game.actions.begin_game) && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "New Game")
      chat_context.draws = 0
      chat_context.game = SecureRandom.uuid
      text_response("Let's start our game of Face Danger 😰! There's only #{pluralize(Game::DRAWS, 'straw')}: may the odds be ever in your favour~", [
        Game.actions.take_a_risk
      ])
    end
  end
end
