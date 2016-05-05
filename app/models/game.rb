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
  BAD_EXCLAMATIONS = [
    "OMG! ",
    "EEK! ",
    "OI! ",
    "DUUUUUDE! ",
    "GIRLFRIENDS! ",
    "WATTTT! ",
    "✋—",
  ].freeze
  GOOD_EXCLAMATIONS = [
    "PHEW! ",
    "WOW! ",
    "WOAH! ",
    "YOU GOT THIS! ",
    "WOOOOP! ",
  ].freeze

  def self.actions
    @@actions ||= OpenStruct.new({
      begin_game: "START",
      score: "Am I winning?",
      take_a_risk: "Draw a straw!!"
    })
  end

  def self.bad_thing
    BAD_THINGS.sample
  end

  def self.bad_exclamation
    BAD_EXCLAMATIONS.sample
  end

  def self.good_exclamation
    GOOD_EXCLAMATIONS.sample
  end
end
