module Responders
  class Restart < ApplicationResponder
    def can_handle?
      match_message "Restart!"
    end

    def handle
      chat_context.clear
      text_response("Restarting...")
    end
  end
end
