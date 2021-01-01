module CardGame
  class Deal
    @deck : Deck
    @hands : Hands
    @tricks : Tricks

    getter :hands, :players, :tricks
  
    def initialize(players = GamePlayers.new)
      @deck = Deck.new
      @hands = Hands.new
      @players = players
      @tricks = Tricks.create
    end

    def self.create(players)
      Deal.new(players).deal
    end

    def current_trick
      @tricks.last
    end

    def deal
      @deck = Deck.create
      @hands = Hands.create(@deck)
      @tricks = Tricks.create
      self
    end

    def play(player, card_str)
      response = Play.new(self, player, card_str).do
      tricks << Trick.new if current_trick.size == 4
      response
    end

    def player_hand(player)
      index = players.index(player)
      hands[index]
    end
  end
end
