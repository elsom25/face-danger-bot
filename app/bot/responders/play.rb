module Responders
  class Play < ApplicationResponder
    def can_handle?
      match_message "Yes!"
    end

    def handle
      # MIXPANEL.track(user.username, "Play")
      chat_context.plays ||= 0
      chat_context.plays = chat_context.plays.to_i + 1
      text_response "You've played #{chat_context.plays} times!"
    end
  end
end
