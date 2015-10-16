class Mastermind
  def initialize
    start_game
  end

  def start_game
    puts 'Welcome to MASTERMIND\n'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    user_input = gets.chomp
    case
    when user_input = 'p'
      play_game
    when user_input = 'i'
      display_instructions
    when user_input = 'q'
      quit
    else
      puts 'Invalid entry. Please try again.'
    end
  end

  def play_game
    puts "playing game"
  end

  def display_instructions
    puts 'displaying instruction'
  end
  def quit

  end
end

Mastermind.new