class Plateau
  attr_reader :square

  def initialize(square)
    @square = square

  end

  def directions
    %w(N E S W)
  end

end
