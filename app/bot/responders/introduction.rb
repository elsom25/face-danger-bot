module Responders
  class Introduction < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker", "start-chatting"

    def can_handle?
      !user.introduced?
    end

    def handle
      user.update! introduced: true
      MIXPANEL.track(user.username, "Introduced")

      reexecute_with(text_response("Hi! I'm Danger Face Bot ☠"))
    end
  end
end
