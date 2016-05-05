module Responders
  class Score < ApplicationResponder
    include ActionView::Helpers::TextHelper

    def can_handle?
      match_message(Game.actions.score) && responses.blank?
    end

    def handle
      reexecute_with(text_response("#{user.username} has played #{pluralize(user.games_played, 'game')}, drawn #{pluralize(user.safe_draws, 'safe straw')}, and been humiliated #{pluralize(user.games_lost, 'time')}."))
    end
  end
end
