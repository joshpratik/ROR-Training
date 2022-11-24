
def hangman(word)
  lifes = 5;
  incomplete_word = Array.new(word.length, "_")  #new aaray of word size
  remaining_chars = word.clone                          #string of remaining words
  r = Random.new                              
  index1 = r.rand(0..word.length/2)
  random_letter1 = word[index1]
  incomplete_word[index1] = random_letter1
  remaining_chars.delete! random_letter1

  index2 = r.rand(word.length/2..word.length-1)
  random_letter2 = word[index2]
  incomplete_word[index2] = random_letter2
  remaining_chars.delete! random_letter2

  while lifes > 0  do
    puts "lifes remaining #{lifes}"     #printing remaining lifes
    puts incomplete_word.join;          #printing word with blank spaces
    puts "Enter the letter : "
    letter = gets.chomp.downcase       
    if(letter.length != 1)
      puts "enter only one letter at a time"  #if user enters more than one letter
      next
    else
      if remaining_chars.include? letter      #checking if entered letter is present in the reamining letters
        incomplete_word[word.index(letter)]=letter  #if exists push that letter on it's place
        remaining_chars.delete! letter              #delete that letter from remaining characters
        if !incomplete_word.include? "_"            #if word is complete then break
          break;
        end
      else
        puts "Ohhhooo!! Wrong letter.!!"
        lifes -= 1                                   #if letter is wrong decrease the life
      end
    end
  end

  if incomplete_word.join.to_s == word                    #check if final word matches input word
    puts "Congratulations!!!..You won...!!!"
  else
    puts "Ooooo...!!!You lost...!!!"
  end
end

words = ["train","rainbow","mouse"]    #declared words array
r = Random.new                              
index = r.rand(0..2)                       #selecting random index
hangman(words[index])                             #passing random word to game
