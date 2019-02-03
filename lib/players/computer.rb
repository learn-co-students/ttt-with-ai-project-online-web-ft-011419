require_relative '../player.rb'

class Players

  class Computer < Player
    attr_accessor :board

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    CORNERS = [0,2,6,8]

    def block
      row_to_block = WIN_COMBINATIONS.find do |combo|
        if @board.cells[combo[0]] != " "
          (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == " ") || (@board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] == " ") || (@board.cells[combo[0]] == @board.cells[combo[2]] && @board.cells[combo[1]] == " ")
        else
          nil
        end
      end

      if row_to_block != nil
        cell_to_block = row_to_block.find {|cell| @board.cells[cell] == " "}
      end
    end

    def win
      winning_row = WIN_COMBINATIONS.find do |combo|
        if @board.cells[combo[0]] != " "
        end
      end
    end


    def move(board)
      @board = board
      if block != nil
        block + 1
      else
        rand(1..9).to_s
      end
    end

  end

end
