class ApplicationResponder < Bot::Responder
protected

  def chat_id
    message["chatId"].to_i
  end

  def timestamp
    message["timestamp"].to_i
  end

  def default_response
    text_response("#{user.username} has played #{user.games_played} and lost #{user.games_lost}. Want to play a game?", default_responses)
  end

  def default_responses
    [
      Action::BEGIN_GAME,
      "No"
    ]
  end
end
