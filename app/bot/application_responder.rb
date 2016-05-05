class ApplicationResponder < Bot::Responder
protected

  def chat_context
    @chat_context ||= ChatContext.new(chat_id)
  end

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
      Action::BEGIN_GAME,
      "No"
    ]
  end
end
