require 'pry'
require_relative 'input_parser'

class Solver
  def initialize(input)
    @parsed_input = InputParser.new(input).parse
  end

  def solve
    @parsed_input.each_with_object('') do |c, s|
      target = c[:sum]
      array = c[:array]

      s << solution_string(target, array) + "\n"
    end.chomp
  end

  def solution_string(target, array)
    array_length = array.count
    array.each_with_index do |element, start_index|
      (array_length - start_index).times do |end_index|
        return "#{start_index + 1} #{end_index + 1}" if array[start_index..end_index].sum == target
      end
    end
  end
end
