class ApplicationResponder < Bot::Responder
protected

  def default_response
    text_response("Want to play a game?", default_responses)
  end

  def default_responses
    [
      "Yes!",
      "No"
    ]
  end
end
