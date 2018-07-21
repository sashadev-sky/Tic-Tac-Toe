require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @player_one, @player_two = player_one, player_two
    player_one.mark = :X
    player_two.mark = :O
    @current_player = player_one
    @board = Board.new
  end

  def play
    until over?
      system("clear")
      board.render
      play_turn
      system("clear")
      board.render
      switch_players!
    end
    board.winner ? abort("#{board.winner} you have won!") : abort("its a tie!")
  end

  def play_turn
    begin
      current_player.receive_board(board)
      move = current_player.get_move
      board.place_mark(move, current_player.mark)
    rescue RuntimeError => e
      puts e.message
      retry
    rescue NoMethodError
      puts "Error: this position is outside of the board"
      retry
    end
  end

  # def winner
  #   board.rows.each do |row|
  #     return :X if row.count(:X) == row.length
  #     return :O if row.count(:O) == row.length
  #   end
  #   board.columns.each do |col|
  #     return :O if col.count(:O) == col.length
  #     return :X if col.count(:X) == col.length
  #   end
  #   board.diagonals.each do |diag|
  #     return :O if diag.count(:O) == diag.length
  #     return :X if diag.count(:X) == diag.length
  #   end
  #
  #   nil
  # end

  def over?
    board.winner || board.grid.none? { |row| row.include?(nil) }
  end

  def switch_players!
    @current_player = current_player == player_one ? player_two : player_one
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
