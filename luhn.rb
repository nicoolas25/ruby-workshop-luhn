# frozen_string_literal: true

# Responsible of checking the validity of a numeric string
# against the Luhn formula or 'mod 10' algorithm
class Luhn
  attr_reader :input

  def initialize(input)
    @input = input.delete(' ')
  end

  def self.valid?(input)
    new(input).valid?
  end

  def valid?
    return false if input.length <= 1 || input =~ /\D/

    (checksum % 10).zero?
  end

  def checksum
    reversed_chars_to_i
      .map
      .with_index(1) { |int, idx| idx.even? ? luhn_double(int) : int }
      .sum
  end

  def reversed_chars_to_i
    input.reverse.chars.map(&:to_i)
  end

  def luhn_double(digit)
    result = 2 * digit
    result -= 9 if result > 9
    result
  end
end
