require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one
  end

  def play
    play_turn until over?
    if winner
      abort("#{winner} you have won!")
    else
      abort("its a tie!")
    end
  end

  def play_turn
    board.render
    current_player.receive_board(board.grid)
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    board.render
    self.switch_players!
  end

  def winner
    left_vertical_count = 0
    right_vertical_count = 0
    column_count_hash = {}
    board.grid.each_with_index do |row, index|
      return :X if row.count(:X) == row.length
      return :O if row.count(:O) == row.length
      if row[index] == :X
        left_vertical_count += 1
      end
      if row[-index + (row.length - 1)] == :X
        right_vertical_count += 1
      end
      return :X if left_vertical_count == row.length || right_vertical_count == row.length
    end
    board.grid.transpose.each do |col|
      return :O if col.count(:O) == col.length
      return :X if col.count(:X) == col.length
    end
    nil
  end

  def over?
    winner || board.grid.none? { |row| row.include?(nil) }
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end
end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  garry = ComputerPlayer.new('garry')

  new_game = Game.new(human, garry)
  new_game.play
end
