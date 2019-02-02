module Players
class Computer < Player
  def move(board) #make computer decide what movereturns
    input = rand(1..9)
    input.to_s#the move the computer wants to make in the form of a 1-9 string
  end
end
end
