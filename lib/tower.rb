class Game
  def initialize
    @tower1 = Tower.new([3, 2, 1])
    @tower2, @tower3 = Tower.new, Tower.new
    @towers = [@tower1, @tower2, @tower3]
  end

  def []= (num, disc_value)
    @towers[num - 1] << disc_value
  end

  def [] (num)
    @towers[num - 1].discs
  end

  def play
    until game_over?
      move(get_move)
    end
    puts "You did it!"

  rescue TowersError
    puts "No good."
    retry
  end

  def move(from, to)
    from, to = from - 1, to - 1
    raise TowersError if @towers[from].empty?
    raise TowersError if @towers[to].top && @towers[to].top < @towers[from].top
    @towers[from].transfer_to(@towers[to])
  end

  def get_move
    puts "Input magic!"
  end

  def game_over?
    @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
  end
end

class Tower
  attr_reader :discs

  def initialize(discs = [])
    @discs = discs
  end

  def transfer_to(other_tower)
    other_tower << @discs.pop
  end

  def empty?
    @discs.empty?
  end

  def top
    @discs.last
  end

  def <<(disc)
    @discs << disc unless disc.nil?
  end

end

class TowersError < StandardError
end
