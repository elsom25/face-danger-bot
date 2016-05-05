module Responders
  class Score < ApplicationResponder
    def can_handle?
      match_message(Game.actions.score) && responses.blank?
    end

    def handle
      reexecute_with [how_are_you_doing, score]
    end

  protected

    def how_are_you_doing
      if winning?
        text_response "#{Game.good_exclamation}#{user.username} IS ROCKING IT! ✨😃👊"
      else
        text_response "#{Game.bad_exclamation}#{user.username} is not doing so hot. Better STEP. IT. UP."
      end
    end

    def score
      text_response "#{user.username} has played #{pluralize(user.games_played, 'game')}, drawn #{pluralize(user.safe_draws, 'safe straw')}, and been humiliated #{pluralize(user.games_lost, 'time')}."
    end

    def winning?
      user.games_played > user.games_lost
    end
  end
end
