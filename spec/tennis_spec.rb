require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry-plus'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }
  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
      expect(game.player2.opponent).to eq(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(game.player1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty'  do
        player.points = 2

        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end

    context 'when player has more than 3 points' do
      context 'when player wins 4 points to 2' do
        it 'returns win' do
          player.points = 4
          player.opponent.points = 2

          expect(player.score).to eq('win')
        end
      end

      context 'when player wins 6 points to 4' do
        it 'returns win' do
          player.points = 6
          player.opponent.points = 4

          expect(player.score).to eq('win')
        end
      end

      context 'when the score is tied' do
        it 'returns deuce' do
          player.points = 4
          player.opponent.points = 4

          expect(player.score).to eq('deuce')
        end
      end

      context 'when player has 1 more point than opponent' do
        it 'returns ad player' do
          player.points = 6
          player.opponent.points = 5

          expect(player.score).to eq('ad player')
        end
      end

      context 'when player has 1 less point than opponent' do
        it 'returns ad opponent' do
          player.points = 6
          player.opponent.points = 7

          expect(player.score).to eq('ad opponent')
        end
      end
    end
  end
end