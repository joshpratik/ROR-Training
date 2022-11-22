=begin
Q2. WAP for students to print their school level according to grade
e.g -
if grade is between 1-5 return elementary
if grade is between 6-8 return middle school
if grade is between 9-12 return high school
if grade is between otherwise return college
=end

def find_grade(grade)  #function for finding grade
    case grade
    when 1..5
        return "elementary"
    when 6..8
        return "middle school"
    when 9..12
        return "high school"
    else
        return "college"
    end
end



puts "Enter a grade : "     
grad = gets.chomp.to_i      #input grade from user
puts find_grade(grad)       #calling function and printing return value



