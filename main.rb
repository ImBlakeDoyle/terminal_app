require_relative 'students.rb'
require 'json'
require 'faker'


# determineBffl = "john"

# Read stored information on .json file
students = File.read('test.json')
studentsArray = JSON.parse(students)

#test array is pulling
#puts studentsArray

#studentsArray.collect { |hashes| hashes["birthday"] = Faker::Dog.breed}
#puts studentsArray

#create new instances of student class for each element of json array, with name of class instance equal to firstname_lastname
# studentsArray.each do |stu_hash|
# instance_variable_set("@#{stu_hash["name"].split.map(&:downcase).join('_')}", Student.new(stu_hash))
# end

# # name search function
puts "Enter student name"
userinput = gets.downcase.chomp

# #randomise data
def determineDog
    favouriteDog = Faker::Dog.breed
end
# 
# chooses two different interests at random
def interestsmethod
   interestarray = ["sleeping", "eating", "breathing", "crying", "having an existential crisis", "overthinking", "rock climbing", "fishing", "reading up on 'self'", "yelling at children", "eating crayons", "finger painting"]
   return "#{interestarray.sample(2).join(" and ")}"
end

def determineHeight
    height = rand(100..300)
end

#puts "my interests include: #{interestsmethod}"

def determineBffl(bfflArray, studentused) 
    bfflChosen = bfflArray.sample {|hash| hash["name"]} ["name"]
    if bfflChosen.downcase == studentused 
        bfflChosen = bfflArray.sample {|hash| hash["name"]} ["name"]
    else
        return bfflChosen
    end
end

def determineNemesis(nemesisArray, studentused) 
    nemesisChosen = nemesisArray.sample {|hash| hash["name"]} ["name"]
    if nemesisChosen.downcase == studentused
        nemesisChosen = nemesisArray.sample {|hash| hash["name"]} ["name"]
    else
        return nemesisChosen
    end
end



def determineAge
    age = rand(7..100)
end

def ageComment
    comment = ["looks fantastic", "looks terrible", "feels a million bucks", "has seen better days", "right knee clicks all the time when they walk for some reason", "could do back to back triathlons"]
    thecomment = comment[rand(comment.length)]
end



nemesis= studentsArray.sample {|hash| hash["name"]}["name"]

bffl= studentsArray.sample {|hash| hash["name"]}["name"]

selectedStudent = studentsArray.find {|hashes| hashes["name"] == userinput}
system"clear"
puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
puts "Age: #{determineAge} and #{ageComment}"
puts "Height: #{determineHeight}cm"
puts "Bffl: #{determineBffl(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
puts "Nemesis is: #{determineNemesis(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
puts "Favourite dog breed: #{determineDog}"
puts "Interests: #{interestsmethod}"
puts "Dislikes: #{dislikes}"

# # class Students
# #     attr_accessor :bffl, :favFood
# #     def initialize name, age


# ###Sorts students by oldest###
# # def findOldestStudent
# #     findOldest = studentsArray.sort_by {|hashes| hashes["age"]}.reverse
# #     for hashes in findOldest
# #     puts "#{hashes["name"]} is #{hashes["age"]} years old"
# #     end
# # end


# #puts selectedStudent
# # puts "Name: #{selectedStudent["name"]}"
# # puts "Age: #{selectedStudent["age"]}"
# # puts "Birthday: #{selectedStudent["birthday"]}"