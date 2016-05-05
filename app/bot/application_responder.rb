class ApplicationResponder < Bot::Responder
  include ActionView::Helpers::TextHelper

protected

  def chat_id
    message["chatId"].to_i
  end

  def timestamp
    message["timestamp"].to_i
  end

  def default_response
    text_response("Want to play a game?", default_responses)
  end

  def default_responses
    [
      Game.actions.begin_game,
      Game.actions.score,
      "No"
    ]
  end
end
