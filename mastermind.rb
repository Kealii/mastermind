class Mastermind
  attr_reader :guesses, :answer, :start_time, :end_time

  def initialize
    start_game
  end

  def start_game
    system "clear"
    puts 'Welcome to MASTERMIND'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    user_input = gets.chomp
    @start_time = Time.now
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

  def answer
    @answer = ['r','g','b','y'].shuffle
  end

  def play_game
    system "clear"
    answer
    puts answer.join
    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow.\n\n"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    @guess = gets.chomp.downcase
    guesses
  end

  def total_time
    total_seconds = @end_time.strftime("%k%M%S").to_i - @start_time.strftime("%k%M%S").to_i
  end

  def guesses
    system "clear"
    if @guess == @answer.join
      @end_time = Time.now
      puts "You guess the right answer in #{total_time} seconds!"
    elsif @guess == 'c' || @guess == 'cheat'
      puts "rgby"
    elsif @guess == 'q' || @guess == 'quit'
      quit
    elsif @guess.length < 4
      puts "Guess too short"
    elsif @guess.length > 4
      puts "Guess too long"
    else
      puts "Incorrect guess or edge case."
    end
  end

  def display_instructions
    puts 'Try to guess the order of the 4 elements by putting in a guess like:'
    puts 'rgby or RGBY. Guesses are not case sensitive. Good luck!'
  end

  def quit
    system "clear"
    puts 'Bye bye!'
  end
end

Mastermind.new