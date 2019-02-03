require 'pry'

class Board

	attr_accessor :cells


	def initialize
		reset!
	# @board = []
	# @cells = [" ", " "," ", " "," ", " "," ", " "," "]
	end


	def reset!
    @cells = Array.new(9, " ")
	end

	def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
	end

	def position(input)
    real_input = input.to_i
    @cells[real_input-1]
	end

	def update(position, player)
    rposition = position.to_i
    @cells[rposition-1] = player.token
		# When you update the appropriate index in the cells, you will set it equal to
		# the token of the player object by calling the #token method on the player.
  end
	def full?
    if @cells.detect {|i| i == " " || i == nil}
    false
  else
    true
  end
	end

	def turn_count
    count = 0
  @cells.each do |el|
    if el != " "
      count+=1
    end
  end
  count
	end

	def taken?(position)
    rposition = position.to_i - 1
    if @cells[rposition] == " " || @cells[rposition] == ""
false
    elsif @cells[rposition] == nil
false
    else
true
    end

	end

	def valid_move?(input)
    if input.length < 2
    position = input.to_i
      if taken?(position)
        false
      else
        true
      end
    end

	end

end
