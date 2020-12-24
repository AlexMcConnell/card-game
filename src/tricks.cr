module CardGame
  class Tricks < Array(Trick)
    def self.create
      tricks = Tricks.new
      tricks << Trick.new
      tricks
    end
  end
end
