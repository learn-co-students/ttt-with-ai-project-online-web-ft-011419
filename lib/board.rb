class Board
  attr_accessor :cells
  @cells = []
  def reset!
    self.cells = Array.new(9, " ")
  end 
  def initialize
    self.cells = Array.new(9, " ")
  end 
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end 
  def position(input)
    self.cells[input.to_i-1]
  end 
  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end 
  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end 
  def taken?(position)
    self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
  end 
  def valid_move?(input)
    !(taken?(input.to_i)) && input.to_i.between?(1, 9)
  end
  def update(input, player)
    cells[input.to_i-1] = player.token
  end 
end 