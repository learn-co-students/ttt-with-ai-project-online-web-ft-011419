
module Players
class Human < Player

  def move(board) #allows player to enter a move via the CLI, the method should return the value the user enters
      puts "Please enter your selection:"
      input = gets.strip
      input
  end
end
end
