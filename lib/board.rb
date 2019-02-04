class Board

  attr_accessor :cells

  def initialize
    reset!
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
    i = input.to_i
    @cells[i-1]
  end

  def update(position, player)
     pos = position.to_i
     @cells[pos - 1] = player.token
  end

    def full?
      if @cells.detect { |i| i == " " || i == nil}
        false
      else
        true
      end
    end

    def turn_count
      count = 0
     @cells.each do |i|
        if i != " "
        count += 1
        end
      end
      count
    end

    def taken?(position)
      pos = position.to_i - 1
      if @cells[pos] == " " || @cells[pos] == ""
        false
      elsif @cells[pos] == nil
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
