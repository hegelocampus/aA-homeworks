require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
    @player1 = name1
    @player2 = name2
  end

  def set_cups
    @cups = Array.new(14).map!.with_index do |cup, idx|
      (idx == 6 || idx == 13) ? [] : Array.new(4) { :stone }
    end
  end

  def place_stones
    Array.new(14).map.with_index do |cup, idx|
      (idx == 6 || idx == 13) ? [] : Array.new(4) { :stone }
    end
  end

  def valid_move?(start_pos)
    unless (0...cups.length).to_a.include?(start_pos)
      raise 'Invalid starting cup'
    end
    raise 'Starting cup is empty' if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    other_player_cup_idx = (start_pos < 6) ? 13 : 6 
    cache = []
    cache += cups[start_pos]
    moves = cache.length
    cups[start_pos] = []

    idx = start_pos
    n = 0
    while n < moves do
      idx = (idx + 1) % 13 
      unless idx == other_player_cup_idx
        cups[idx] << cache.pop
        n += 1
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (cups[1..6].all?(&:empty?)) || (cups[8..12].all?(&:empty?))
  end

  def winner
    render
    p1_score = cups[6].count
    p2_score = cups[13].count
    if p1_score > p2_score
      @player1
    elsif p1_score < p2_score
      @player2
    else
      :draw
    end
  end

  def inspect
    cups.map { |cup| cup.length }.inspect
  end
end
