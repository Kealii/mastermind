class Mastermind
  attr_reader :guesses

  def initialize
    start_game
  end

  def start_game
    puts 'Welcome to MASTERMIND'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    user_input = gets.chomp
    case
    when user_input == 'p'
      play_game
    when user_input == 'i'
      display_instructions
    when user_input == 'q'
      quit
    else
      puts 'Invalid entry. Please try again.'
    end
  end

  def play_game
    system "clear"
    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    @guess = gets.chomp.downcase
    guesses
  end

  def guesses
    system "clear"
    puts "thanks for guessing #{@guess}"
    quit
  end

  def display_instructions
    puts 'displaying instructions'
  end

  def quit
    puts 'Bye bye!'
  end
end

Mastermind.new