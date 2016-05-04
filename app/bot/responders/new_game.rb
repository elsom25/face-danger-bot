module Responders
  class NewGame < ApplicationResponder
    def can_handle?
      match_message("Yes!") && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "New Game")
      chat_context.shots = 0
      text_response("Let's start our game of Face Danger 😰! There's only 6 shots loaded: may the odds be ever in your favour~", [
        "Pull the trigger!!!"
      ])
    end
  end
end
