module Responders
  class Default < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker"

    def can_handle?
      true
    end

    def handle
      MIXPANEL.track(user.username, "Default")
      default_response
    end
  end
end
