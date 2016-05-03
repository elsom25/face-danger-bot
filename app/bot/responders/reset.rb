module Responders
  class Reset < ApplicationResponder
    def can_handle?
      match_message "Reset!"
    end

    def handle
      user.destroy!
      text_response("Resetting...")
    end
  end
end
