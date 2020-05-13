# frozen_string_literal: true

class Luhn
  attr_reader :input

  def initialize(input)
    @input = input.delete(' ')
  end

  def self.valid?(input)
    new(input).valid?
  end

  def valid?
    return false if input.length < 2 || input =~ /\D/

    (checksum % 10).zero?
  end

  private

  def checksum
    digits.each_slice(2).sum { |first, second = 0| first + double(second) }
  end

  def digits
    input.chars.reverse.map(&:to_i)
  end

  def double(digit)
    2 * digit > 9 ? (2 * digit - 9) : digit * 2
  end
end
