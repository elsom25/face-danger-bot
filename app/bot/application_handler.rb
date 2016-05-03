class ApplicationHandler < Bot::Handler
  use Responders::Default

  def user_for(message)
    user = User.find_or_create_by(username: message["from"])
    MIXPANEL.people.set(user.username, {
      username: user.username
    })
    user
  end
end