# Demo for writing class and class methods


class  Number
  def self.addition(*numbers)           #method for additin of numbers accepting variable number of arguments
    iterator = 0
    sum = 0
    while iterator < numbers.length
      sum += numbers[iterator]          #adding all input numbers
      iterator += 1
    end
    sum                                 #last statement is return value              
  end

  def self.multiplication(*numbers)     #method for multiplication of numbers  
    iterator = 0
    product = 1
    while iterator < numbers.length
      product *= numbers[iterator]
      iterator += 1
    end
    product
  end

  def self.substraction(number1, number2) #method for substraction of numbers
    number1 - number2
  end

  def self.division(number1, number2)     #method for division of numbers
    number1 / number2
  end

  def self.is_prime(number)               #method for if number is prime
    flag = true
    if number < 2
      return false
    elsif number > 2
      (2..(number / 2)).each do |iterator|
        return false if (number % iterator == 0)
        end
    end
    true
  end

  def self.modulus(number1, number2)    #method for modulus of numbers
    number1 % number2
  end

  def self.reverse(number)              #method for reverse a number 
    reverse_number = 0
    while number > 0
      reverse_number = (reverse_number * 10) + number % 10
      number /= 10
    end
    reverse_number
  end
end

puts Number.addition(1,2,3,4,5)
puts Number.multiplication(1,2,3,4,5)
puts Number.division(5,2)

if Number.is_prime(2)
  puts "Number is prime"
else
  puts "Number is not prime"
end

puts Number.reverse(123)