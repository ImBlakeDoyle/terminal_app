require_relative 'students.rb'
require 'json'
require 'faker'


determineBffl = "john"


students = File.read('test.json')
studentsArray = JSON.parse(students)

puts studentsArray

studentsArray.each do |stu_hash|
instance_variable_set("@#{stu_hash["name"]}", Student.new(stu_hash))
end

# puts "Enter student name"
# userinput = gets.downcase.chomp

# selectedStudent = studentsArray.find {|hashes| hashes["name"] == userinput}

# puts "Name is: #{selectedStudent["name"]}"
# puts "Age is: #{selectedStudent["age"]}"
# puts "Birthday is: #{selectedStudent["birthday"]}"
# puts "Bffl is: #{selectedStudent["bffl"]}"

# class Students
#     attr_accessor :bffl, :favFood
#     def initialize name, age


###Sorts students by oldest###
# def findOldestStudent
#     findOldest = studentsArray.sort_by {|hashes| hashes["age"]}.reverse
#     for hashes in findOldest
#     puts "#{hashes["name"]} is #{hashes["age"]} years old"
#     end
# end


#puts selectedStudent
# puts "Name: #{selectedStudent["name"]}"
# puts "Age: #{selectedStudent["age"]}"
# puts "Birthday: #{selectedStudent["birthday"]}"