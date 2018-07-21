require 'byebug'

class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def receive_board(board)
    @board = board
  end

  def other_player_mark
    mark_idx = board.marks.index(mark)
    board.marks[mark_idx - 1]
  end

  def get_move
    moves = available_moves
    moves.each { |move| return move if wins?(move) }
    moves.each { |move| return move if other_player_wins?(move) }

    available_moves.sample
  end

  def available_moves
    available_moves = []
    board.rows.each_with_index do |row, index1|
      row.each_with_index do |col, index2|
        available_moves << [index1, index2] if col == nil
      end
    end
    available_moves
  end

  def wins?(move)
    board[move] = mark
    if board.winner == mark
      board[move] = nil
      true
    else
      board[move] = nil
      false
    end
  end

  def other_player_wins?(move)
    board[move] = other_player_mark
    if board.winner == other_player_mark
      board[move] = nil
      true
    else
      board[move] = nil
      false
    end
  end

end
