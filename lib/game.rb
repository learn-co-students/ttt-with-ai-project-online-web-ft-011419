class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def current_player
  n = board.turn_count
  if n%2 == 0
    player_1
  else
    player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
    win_1 = combination[0]
    win_2 = combination[1]
    win_3 = combination[2]
    pos_1 = board.cells[win_1]
    pos_2 = board.cells[win_2]
    pos_3 = board.cells[win_3]
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      combination
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      combination
      else
      false
      end
    end
  end

  def draw?
    if won?
      false
    elsif  @board.full? && !won?
      true
    end
  end

  def over?
    won? || draw?
  end

  def winner
    o_count = 0
    x_count = 0
    @board.cells.each do |i|
      if i == "X"
        x_count += 1
      elsif i == "O"
        o_count += 1
      end
    end
    if x_count > o_count
      "X"
    elsif x_count < o_count
      "O"
    else
      nil
    end
  end

  def turn
    player = current_player
    move = player.move(board)
    if !@board.valid_move?(move)
      turn
    else
      @board.update(move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
