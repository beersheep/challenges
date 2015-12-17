require 'pry'

class Octal
  def initialize(number)
    @octal = number
  end

  def to_decimal

    return 0 if !@octal.match(/^[0-7]+$/)

    number_array = @octal.split('').reverse
    number_array.map!(&:to_i)

    number_array.collect!.with_index do |num, index|
      num * 8 ** index
    end


    sum = 0 

    number_array.each do |num|
      sum += num
    end

    sum
    
  end
end