class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false

  end

  def play
    until game_over
      take_turn
    end
  #rescue
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    for color in @seq do
      system "clear"
      puts "--#{ color }--"
      t = [0.5, 0.5, 0.5, 0.75, 0.75, 0.25].sample
      sleep t
      system "clear"
    end
  end

  def require_sequence
    i = 0
    for color in @seq do
      i == 0 ? (puts "Enter the first color:") : (puts "Enter the next color:")
      input = gets.chomp 
      raise "invalid" if input != color 
      system "clear"
      i += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job! You successfully repeated the sequence!"
  end

  def game_over_message
    puts "Oops! That wasn't right! You got up to #{sequence_length}!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

Simon.new.play

