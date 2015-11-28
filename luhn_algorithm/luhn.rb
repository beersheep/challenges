require 'pry'

class Luhn 
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def addends
    number = @num.to_s.split('').map(&:to_i)
    index = -2

    begin 
      sum = number[index] * 2 
      number[index] = check_number_over_10(sum)
      index -= 2 
    end until index.abs > number.size

    number

    # number.each_with_index do |value, index|
    #   if number.size.odd?
    #     if index.odd?
    #       sum = value * 2 
    #       number[index] = check_number_over_10(sum)
    #     end
    #   else 
    #     if index.even?
    #       sum = value * 2
    #       number[index] = check_number_over_10(sum) 
    #     end
    #   end
    # end
  end

  def checksum
    number = self.addends
    sum = 0 

    number.each { |num| sum += num }

    sum
  end

  def valid?
    self.checksum % 10 == 0 ? true : false
  end

  def self.create(num)
    series = Luhn.new(num)
    num_array = %w(1 2 3 4 5 6 7 8 9 0)

    num_array.each do |i|
      series.num = num.to_s << i
      break if series.valid?
    end
    series.num.to_i
  end
  
  private

  def check_number_over_10(num)
    if num > 10
      digits = num.to_s.split('').map(&:to_i)
      result = digits[0] + digits[1]
    else 
      num
    end
  end

end




