module Responders
  class Shot < ApplicationResponder
    include ActionView::Helpers::TextHelper
    ROUNDS = 6

    def can_handle?
      match_message("Pull the trigger!!!") && responses.blank?
    end

    def handle
      MIXPANEL.track(user.username, "Shot")
      shots = chat_context.shots.to_i
      random = Random.new(timestamp + chat_id)

      if random.rand(ROUNDS - shots).zero?
        chat_context.playing = false
        reexecute_with(text_response("BAM! #{user.username} was shot! 😱"))
      else
        chat_context.shots = shots += 1
        reexecute_with(text_response("PHEW! #{user.username} has avoided face danger! Only #{pluralize(ROUNDS - shots, 'shot')} left!"))
      end
    end
  end
end
