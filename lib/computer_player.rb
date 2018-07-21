require 'byebug'

class ComputerPlayer
  attr_accessor :board, :mark

  def initialize(name)
    @name = "Bonzo"
    @mark = :O
  end

  def receive_board(board)
    @board = board
  end

  # logic for converting diagonal indices back to the correct indices on the grid (row, col) in get_move:
    # the first index is always == row
    # if its a left diagonal, the first index will also == col
    # if its a right diagonal, -first index + 2 == col

 def get_move
  [@board.rows, @board.columns, @board.diagonals].each_with_index do |iteration, tracker|
    iteration.each_with_index do |sub_iter, idx1|
      if sub_iter.count(mark) == sub_iter.length - 1 && sub_iter.any? { |position| position == nil }
        idx2 = sub_iter.index { |posit| posit == nil }
        return [idx1, idx2] if tracker == 0
        return [idx2, idx1] if tracker == 1
        return [idx2, idx2] if tracker == 2
        return [idx2, (-idx2 + (sub_iter.length - 1))] if tracker == 3
      end
    end
  end
  available_moves = []
  @board.rows.each_with_index do |row, index1|
    row.each_with_index do |col, index2|
      if col == nil
        available_moves << [index1, index2]
      end
    end
  end
  available_moves.sample
 end

end
