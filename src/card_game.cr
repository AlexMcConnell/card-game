require "./game"
require "./deal"
require "./deck_of_cards/deck"

module CardGame
  def self.create
    Game.new
  end
end
