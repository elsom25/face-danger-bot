module Responders
  class Introduction < ApplicationResponder
    respond_to "scan-data", "text", "link", "picture", "video", "sticker", "start-chatting"

    def can_handle?
      !user.introduced?
    end

    def handle
      user.update! introduced: true
      MIXPANEL.track(user.username, "Introduced")

      reexecute_with(text_response("Hi! I'm Danger Straw. I run a risky game you can play with friends. There are #{pluralize(Game::DRAWS, 'straw')} that you take turns drawing. But hope you don't draw the short one, or something sooo not lit will happen to you!"))
    end
  end
end
