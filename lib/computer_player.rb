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


  def get_move
    #still need to add diagonal capabilities
    @board.each_with_index do |row, index1|
      if row.count(mark) == row.length - 1
        row.each_with_index do |col, index2|
          return [index1, index2] if col == nil
        end
      end
    end
    @board.transpose.each_with_index do |row, index1|
      if row.count(mark) == row.length - 1
        row.each_with_index do |col, index2|
          return [index2, index1] if col == nil
        end
      end
    end
    available_moves = []
    @board.each_with_index do |row, index1|
      row.each_with_index do |col, index2|
        if col == nil
          available_moves << [index1, index2]
        end
      end
    end
    available_moves.sample
  end

end
