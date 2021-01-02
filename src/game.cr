module CardGame
  class Game
    getter :players

    def initialize
      @deal = Deal.new
      @players = GamePlayers.new
    end

    def add_player(name)
      @players << GamePlayer.new(name) unless full?
    end

    def current_trick
      @deal.current_trick
    end

    def hands
      @deal.hands
    end

    def new_deal
      raise MissingPlayerError.new unless full?
      @deal = Deal.create(@players)
    end

    def play(player, card_str)
      @deal.play(player, card_str)
    end

    def player_hand(player)
      @deal.player_hand(player)
    end

    def to_json(player)
      p_hand = player_hand(player)
      json_hands = hands.map do |hand|
        hand == p_hand ? hand : hand.map { "" }
      end
      {
        hands: json_hands,
        player_number: hands.index(p_hand),
        tricks: tricks
      }.to_json
    end

    def tricks
      @deal.tricks
    end

    private def full?
      @players.size == MAX_PLAYERS
    end
  end
end
