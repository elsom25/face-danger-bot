class Game
  DRAWS = 6.freeze
  BAD_THINGS = [
    " was pantsed! 😱",
    " got pied in the face! 🙃",
    " has to go to summer school! 🙅",
    " dropped their ice cream! 🍦☹",
    " was dealt a surprise math test! 😴",
    " got a pop quiz! 🙇",
    " fell down in front of their hot crush! 🤕",
    " forgot their gym shorts! 😩",
    " bailed during a sick ollie! 🏂",
    " got a pimple! 🔴",
    " lost their phone! 📱❌",
    " stepped in dog poo! 🐕💩",
    "'s crush saw them picking their nose! 👃🙈",
  ].freeze


  def self.actions
    @@actions ||= OpenStruct.new({
      begin_game: "Yes!",
      score: "How am I doing?",
      take_a_risk: "Draw a straw!!"
    })
  end

  def self.bad_thing
    BAD_THINGS.sample
  end
end
