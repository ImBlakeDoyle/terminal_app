
loop do
puts "~~~~~Welcome to the Coder Academy 2018 Student Directory!~~~~~"
puts ""
puts ""
puts "Type the first name and last name of any student to begin"
puts ""
puts "For more help, type 'help'"
userinput = gets.downcase.chomp
    if userinput == studentsArray.find {|hashes| hashes["name"] == userinput}
        displayInfo
    elsif userinput == "help"
        displayHelp
    else puts "Sorry, I didn't recognise that command"
    end

loop do
def displayInfo
    selectedStudent = studentsArray.find {|hashes| hashes["name"] == userinput}
system"clear"
puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
puts "Age: #{determineAge} and #{ageComment}"
puts "Height: #{determineHeight}cm"
puts "Bffl: #{determineBffl(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
puts "Nemesis: #{determineNemesis(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
puts "Favourite dog breed: #{determineDog}"
puts "Interests: #{interestsMethod}"
puts "Dislikes: #{dislikesMethod}"
puts ""
puts ""
puts ""
puts "To go back to the main menu, type 'back'"
userinput = gets.downcase.chomp
    if userinput == "back"

    else puts "incorrect response"
    end
end
