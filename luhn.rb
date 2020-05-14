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

    transformed = input.reverse.chars.map(&:to_i)
    transformed.map.with_index(1) do |int, idx|
      if idx.even?
        double = 2 * int
        double -= 9 if double > 9
        double
      else
        int
      end
    end.sum % 10 == 0
  end
end
