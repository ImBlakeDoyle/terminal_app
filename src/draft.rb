require_relative 'students.rb'
require 'json'
require 'faker'


fJSON = File.read('test.json')
studentsArray = JSON.parse(fJSON)

# create new instances of student class for each element of json array, with name of class instance equal to firstname_lastname
studentsArray.each do |stu_hash|
    instance_variable_set("@#{stu_hash["name"].split.map(&:downcase).join('_')}", Student.new(stu_hash))
end


puts "~~~~~Welcome to the Coder Academy 2018 Student Directory!~~~~~"
puts ""
puts ""
puts "Type the first name and last name of any student to begin"
puts ""
puts "For more help, type 'help'"

userinput = gets.downcase.chomp
# # if userinput == studentsArray.find {|hashes| hashes["name"] == userinput}["name"]
# if Student.student_hashes.any? {|hashes| hashes["name"] == userinput}
#     # which array index no is this student
#   studentindex = Student.student_hashes.index {|hashes| hashes["name"] == userinput}
#   puts Student.all[studentindex].name
# elsif userinput == "help"
#     Student.studentlist
# else puts "wrong input"
# end

# puts "age is: #{Student.all["age"]}"
if Student.student_hashes.any? {|hashes| hashes["name"] == userinput}
selectedStudent = Student.student_hashes.find {|hashes| hashes["name"] == userinput}
system"clear"
    puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join('_')}"
    puts "Age: #{selectedStudent["age"]}"
    puts "Height: #{selectedStudent["height"]}"

elsif userinput == "help"
    puts "help"
    sleep(2)
    exit
else  #userinput != studentsArray.find {|hashes| hashes["name"] == userinput}
    puts" it's fucked"
    sleep(2)
    exit
end

