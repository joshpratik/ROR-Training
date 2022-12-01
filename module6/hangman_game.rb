def hangman(word)
  lifes = 5;
  incomplete_word = Array.new(word.length, "_")  #new aaray of word size                          
  while lifes > 0  do
    puts "\nlifes remaining #{lifes}\n"     #printing remaining lifes
    puts incomplete_word.join(" ");          #printing word with blank spaces
    puts "\nEnter the letter : "
    letter = gets.chomp.downcase       
    if(letter.length != 1)
      puts "\nenter only one letter at a time"  #if user enters more than one letter
      next
    else
      if word.include? letter      #checking if entered letter is present in the reamining letters
        word.chars.each_with_index do |ch , index|   #loop for positioning the guessed character at perticular position
          incomplete_word[index] = ch if ch == letter     
        end
        break if !incomplete_word.include? "_"            #if word is complete then break
      else
        puts "\nOhhhooo!! Wrong letter.!!"
        lifes -= 1                                   #if letter is wrong decrease the life
      end
    end
  end

  if incomplete_word.join.to_s == word                    #check if final word matches input word
    puts word
    puts "\nCongratulations!!!..You won...!!!"
  else
    puts "\nOoooo...!!!You lost...!!!"
  end
end

arr = ['allayed','miasma','putrescences','thiols','powderers','duties','encapsulations','dehydrators','congaed','corridors']
hangman(arr.sample)


=begin
Test Cases : 

1 =>
lifes remaining 5
_ _ _ _ _ _ _ _ _ _ _ _
Enter the letter : 
p
lifes remaining 5
p _ _ _ _ _ _ _ _ _ _ _
Enter the letter : 
u
lifes remaining 5
p u _ _ _ _ _ _ _ _ _ _
Enter the letter : 
e
lifes remaining 5
p u _ _ e _ _ e _ _ e _
Enter the letter : 
e
lifes remaining 5
p u _ _ e _ _ e _ _ e _
Enter the letter : 
t
lifes remaining 5
p u t _ e _ _ e _ _ e _
Enter the letter : 
s
lifes remaining 5
p u t _ e s _ e _ _ e s
Enter the letter : 
c
lifes remaining 5
p u t _ e s c e _ c e s
Enter the letter : 
n
lifes remaining 5
p u t _ e s c e n c e s
Enter the letter : 
e
lifes remaining 5
p u t _ e s c e n c e s
Enter the letter : 
r
putrescences
Congratulations!!!..You won...!!!

2 =>
lifes remaining 5
_ _ _ _ _ _ _
Enter the letter : 
r
Ohhhooo!! Wrong letter.!!
lifes remaining 4
_ _ _ _ _ _ _
Enter the letter : 
r
Ohhhooo!! Wrong letter.!!
lifes remaining 3
_ _ _ _ _ _ _
Enter the letter : 
r
Ohhhooo!! Wrong letter.!!
lifes remaining 2
_ _ _ _ _ _ _
Enter the letter : 
r
Ohhhooo!! Wrong letter.!!
lifes remaining 1
_ _ _ _ _ _ _
Enter the letter : 
r
Ohhhooo!! Wrong letter.!!
Ooooo...!!!You lost...!!!

=end
