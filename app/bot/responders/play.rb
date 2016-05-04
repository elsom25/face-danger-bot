module Responders
  class Play < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"

    include ActionView::Helpers::TextHelper
    ROUNDS = 6

    def can_handle?
      chat_context.playing == true.to_s
    end

    def handle
      text_response("You ready?", [
        "Pull the trigger!!!"
      ])
    end
  end
end
