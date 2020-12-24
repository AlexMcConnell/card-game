module CardGame
  class Hands < Array(Hand)
    def self.create(deck)
      hands = Hands.new
      NUMBER_OF_HANDS.times { hands << Hand.new }
      hands.each { |hand| STARTING_HAND_SIZE.times { hand << deck.deal } }
      hands
    end
  end
end
