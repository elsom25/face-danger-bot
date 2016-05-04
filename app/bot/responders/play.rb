module Responders
  class Play < ApplicationResponder
    include ActionView::Helpers::TextHelper
    ROUNDS = 6

    def can_handle?
      match_message("Pull the trigger!!!") && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "Play")
      shots = chat_context.shots.to_i
      random = Random.new(timestamp + chat_id)

      if random.rand(ROUNDS - shots).zero?
        chat_context.shots = 0
        reexecute_with(text_response("BAM! #{user.username} was shot! 😱"))
      else
        chat_context.shots = shots += 1
        text_response("PHEW! #{user.username} has avoided face danger! Only #{pluralize(ROUNDS - shots, 'shot')} left!", [
          "Pull the trigger!!!"
        ])
      end
    end
  end
end
