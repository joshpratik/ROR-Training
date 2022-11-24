#5. Write a program to find IP address class
puts "enter ip address : "
ip = gets.chomp

if ip.match(/^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))$/)
  oparr = ip.split(".")
  case oparr[0].to_i
    when 1..126
      puts "class A"
    when 128..191
      puts "class B"
    when 192..223
      puts "class C"
    when 224..239
      puts "class D"
    when 240..254
      puts "class E"
    else
      puts "invalid ip"
    end
else 
  puts "invalid ip"
end