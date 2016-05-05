module Responders
  class NewGame < ApplicationResponder
    def can_handle?
      match_message(Action::BEGIN_GAME) && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "New Game")
      chat_context.shots = 0
      chat_context.playing = true
      text_response("Let's start our game of Face Danger 😰! There's only 6 shots loaded: may the odds be ever in your favour~", [
        Action::TAKE_A_RISK
      ])
    end
  end
end
