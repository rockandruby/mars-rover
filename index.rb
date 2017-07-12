#!/usr/bin/env ruby

require_relative 'plateau'
require_relative 'rover'

p 'Enter plateau dimensions: '
square = gets.chomp
plateau = Plateau.new(square.split(' ').map(&:to_i))

p 'Enter rover#1 position: '
position = gets.chomp
p 'Enter rover#1 instructions: '
instructions = gets.chomp
rover1 = Rover.new(position, instructions, plateau)

p 'Enter rover#2 position: '
position = gets.chomp
p 'Enter rover#2 instructions: '
instructions = gets.chomp
rover2 = Rover.new(position, instructions, plateau)

rover1.move
rover2.move

p rover1.position
p rover2.position