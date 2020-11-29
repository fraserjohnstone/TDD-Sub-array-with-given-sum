require 'pry'

class InputParser
  def initialize(input)
    @input = input
  end

  def parse
    cases.map do |c|
      {
        sum: c.first.split(' ').last.to_i,
        array: c.last.split(' ').map(&:to_i)
      }
    end
  end

  private

  def lines
    @input.split("\n")
  end

  def num_cases
    lines.first.to_i
  end

  def cases
    lines[1..-1].each_slice(2).to_a
  end
end
