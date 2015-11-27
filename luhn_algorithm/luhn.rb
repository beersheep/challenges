require 'pry'

class Luhn 
  def initialize(num)
    @num = num
  end

  def addends
    individual = @num.to_s.split('')
    number = individual.map(&:to_i)

    result = []

    number.each_with_index do |value, index|
      if number.size.odd?
        if index.odd?
          sum = value * 2 
          number[index] = check_number_over_10(sum)
        end
      else 
        if index.even?
          sum = value * 2
          number[index] = check_number_over_10(sum) 
        end
      end
    end
  end

  def checksum
    number = self.addends
    sum = 0 

    number.each do |num|
      sum += num
    end

    sum
  end

  def valid?
    self.checksum % 10 == 0 ? true : false
  end

  def self.create(num)
    if num.valid? 
      self.addends
    end
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


# 1. find the most right num [-1]
# 2. 