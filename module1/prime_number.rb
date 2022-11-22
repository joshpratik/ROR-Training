#Q1. WAP to display number is prime or not


puts "Enter a number : "
number =gets.chomp.to_i     #input from user
count = 0
it = 1
while it<=number
    if number%it == 0
        count+=1            #increasing count if number is divisible by it
    end
    it+=1   
end
if count == 2               #prime number have only 2 factors 1 and that number itself
    puts "#{number} is a prime number"
else
    puts "#{number} is not a prime number"
end