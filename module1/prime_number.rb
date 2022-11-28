#Q1. WAP to display number is prime or not

puts "Enter a number : "
number = gets.chomp.to_i     #input from user
flag = true
iterator = 2
if number < 2
  flag = false
elsif number > 2
  while iterator <= number/2
    if number % iterator == 0
      flag = false
      break
    end
    iterator += 1
  end
end

if flag
  puts "#{number} is prime"
else
  puts "#{number} is not prime"
end
