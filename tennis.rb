module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - instance object of Player class
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      winner.record_won_ball!
      return winner.score
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'forty' if @points == 3
      return 'win' if @points > 3 && @opponent.points <= @points - 2
      return 'deuce' if @points > 3 && @points == @opponent.points
      return 'ad player' if @points > 3 && @points == @opponent.points + 1
      return 'ad opponent' if @points > 3 && @points == @opponent.points - 1
    end
  end
end