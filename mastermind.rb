class Mastermind
  attr_reader :guesses,
              :answer,
              :start_time,
              :end_time,
              :past_guesses,
              :cheated

  def initialize
    start_game
  end

  def start_game
    system "clear"
    puts 'Welcome to MASTERMIND'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    user_input = gets.chomp
    @cheated = false
    @past_guesses = []
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
    puts "I have generated a beginner sequence with four elements made up of: "
    puts "(r)ed, (g)reen, (b)lue, and (y)ellow.\n\n"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    @guess = gets.chomp.downcase
    guesses
  end

  def total_time
    seconds = @end_time.strftime("%S").to_i - @start_time.strftime("%S").to_i
    minutes = @end_time.strftime("%M").to_i - @start_time.strftime("%M").to_i
    total_seconds = minutes * 60 + seconds
    total_minutes = total_seconds / 60
    final_seconds = total_seconds % 60
    total = "#{total_minutes.to_s} minutes and " + "#{final_seconds.to_s} seconds"
  end

  def guesses
    system "clear"
    if @guess == @answer.join
      @end_time = Time.now
      if @cheated == false
        puts "You guessed the right answer in #{total_time}!"
      else
        puts "You guessed the right answer in #{total_time}! Even if you had to cheat :P"
      end
    elsif @guess == 'c' || @guess == 'cheat'
      @cheated = true
      puts "#{@answer.join}"
      puts "Please Guess"
      @guess = gets.chomp.downcase
      guesses
    elsif @guess == 'q' || @guess == 'quit'
      quit
    elsif @guess.length < 4
      puts "Guess too short. Please try again."
      @guess = gets.chomp.downcase
      guesses
    elsif @guess.length > 4
      puts "Guess too long. Please try again."
      @guess = gets.chomp.downcase
      guesses
    else
      @past_guesses << @guess
      @past_guesses.each do |guess|
        puts "#{guess}"
      end
      puts "Incorrect guess. Please try again"
      @guess = gets.chomp.downcase
      guesses
    end
  end

  def display_instructions
    system "clear"
    puts 'Try to guess the order of the 4 elements by putting in a guess like:'
    puts 'rgby or RGBY. Guesses are not case sensitive. Good luck!'
    puts 'M(ain) menu or Q(uit).'
    choice = gets.chomp.downcase
    if choice == 'm' || choice == 'main'
      play_game
    elsif choice == 'q' || choice == 'quit'
      quit
    else
      puts "Invalid character. Quitting."
      quit
    end
  end

  def quit
    system "clear"
    puts 'Bye bye!'
  end
end

Mastermind.new