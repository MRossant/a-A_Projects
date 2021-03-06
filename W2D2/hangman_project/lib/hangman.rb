class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    secret_word_chars = @secret_word.split("")
    secret_word_chars.each_index.select {|i| secret_word_chars[i] == char}
  end

  def fill_indices(char, array_indices)
    array_indices.each {|i| @guess_word[i] = char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1 if @secret_word.index(char) == nil
      self.fill_indices(char, self.get_matching_indices(char))
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    response = gets.chomp
    self.try_guess(response)
  end

  def win?
    if @guess_word == @secret_word.split("")
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end
  
end
