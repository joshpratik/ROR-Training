#Q3. Print a-z in reverse order

myarr = [*?a..?z]       #creating array of a-z alphabets
iterator = myarr.length
while iterator >= 0
  puts  myarr[iterator]  #printng array in reverse order while loop
  iterator -= 1
end