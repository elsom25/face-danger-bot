class Game
  DRAWS = 6.freeze
  BAD_THINGS = [
    "was pantsed! 😱",
    "got pied in the face! 🙃"
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
