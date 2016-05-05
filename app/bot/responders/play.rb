module Responders
  class Play < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"

    include ActionView::Helpers::TextHelper
    ROUNDS = 6

    def can_handle?
      chat_context.game.present?
    end

    def handle
      text_response "You ready?", [Game.actions.take_a_risk]
    end
  end
end
