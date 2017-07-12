class Rover

  INSTRUCTIONS = %w(L R M)

  def initialize(position, instructions, plateau)
    @position = position.upcase.split(' ')
    @instructions = instructions.upcase.split('')
    @plateau = plateau
    @out_of_boundary = false
  end

  def move
    return p 'Invalid instructions' unless validate_instructions
    return p 'Invalid initial rover position' unless validate_position(@position[0].to_i, @position[1].to_i)
    direction = @plateau.directions.index(@position.last)
    @instructions.each do |i|
      direction -= 1 if i == 'L'
      direction += 1 if i == 'R'
      direction = 0 if direction > 3 || direction < -3
      @position[2] = @plateau.directions[direction]
      if i == 'M'
        sign = '+'
        sign = '-' if %w(S W).include?(@plateau.directions[direction])
        if %w(E W).include?(@plateau.directions[direction])
          step = @position[0].to_i.send(sign, 1)
          return @out_of_boundary = true unless validate_position(step)
          @position[0] = step
        end
        if %w(N S).include?(@plateau.directions[direction])
          step = @position[1].to_i.send(sign, 1)
          return @out_of_boundary = true unless validate_position(0, step)
          @position[1] = step
        end
      end
    end
  end

  def validate_instructions
    (@instructions.uniq - INSTRUCTIONS).empty?
  end

  def validate_position(x = 0, y = 0)
    @plateau.square[0] >= x && @plateau.square[1] >= y
  end

  def position
    @out_of_boundary ? 'Rover out of boundary' : @position.join(' ')
  end

end
