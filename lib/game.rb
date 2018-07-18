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
    winner ? abort("#{winner} you have won!") : abort("its a tie!")
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
    board.rows.each do |row|
      return :X if row.count(:X) == row.length
      return :O if row.count(:O) == row.length
    end
    board.columns.each do |col|
      return :O if col.count(:O) == col.length
      return :X if col.count(:X) == col.length
    end
    board.diagonals.each do |diag|
      return :O if diag.count(:O) == diag.length
      return :X if diag.count(:X) == diag.length
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
