class Game
  DRAWS = 6.freeze

  def self.actions
    @@actions ||= OpenStruct.new({
      begin_game: "Yes!",
      score: "How am I doing?",
      take_a_risk: "Draw a straw!!"
    })
  end
end
