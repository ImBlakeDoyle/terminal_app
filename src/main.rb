require 'json'
require 'faker'
require 'io/console'

fJSON = File.read('test.json')
@studentsArray = JSON.parse(fJSON)


# #randomise data
def determineDog
    favouriteDog = Faker::Dog.breed
end
# 
# chooses two different interests at random

def interestsMethod
   interestarray = ["sleeping", "eating", "breathing", "crying", "having an existential crisis", "overthinking", "rock climbing", "fishing", "reading up on 'self'", "yelling at children", "eating crayons", "finger painting", "playing soccer", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people"]
   return "#{interestarray.sample(2).join(" and ")}"
end

def dislikesMethod
    interestarray = ["sleeping", "eating", "breathing", "crying", "having an existential crisis", "overthinking", "rock climbing", "fishing", "reading up on 'self'", "yelling at children", "eating crayons", "finger painting", "playing soccer", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people"]
    return "#{interestarray.sample(2).join(" and ")}"
end

def determineHeight
    height = rand(100..300)
end


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

# determineBffl = "john"

# Read stored information on .json file


#test array is pulling
#puts studentsArray

#studentsArray.collect { |hashes| hashes["birthday"] = Faker::Dog.breed}
#puts studentsArray

#create new instances of student class for each element of json array, with name of class instance equal to firstname_lastname
# studentsArray.each do |stu_hash|
# instance_variable_set("@#{stu_hash["name"].split.map(&:downcase).join('_')}", Student.new(stu_hash))
# end

# # name search function

def startScreen
    puts "~~~~~Welcome to the Coder Academy 2018 Student Directory!~~~~~"
    puts ""
    puts ""
    puts "Type the first name and last name of any student to begin"
    puts ""
    puts "For more help, type 'help'"
    puts "To exit, type 'exit'"
end


    # sleep (3)
    # userinput = gets.downcase.chomp
    # selectedStudent = userinput

def help (listofstudents)
    system"clear"
    puts "Here is a list of all available names:"
    puts ""
    listofstudents.each {|x| print x["name"].split.map(&:capitalize).join(' ') + ", "}
    puts ""
    puts ""
    puts ""
    puts ""
    main
#     puts "Type the first name and last name of any student to begin"
#     gets.downcase.chomp
end

def main
    loop do
        startScreen
        userinput = gets.downcase.chomp
        system"clear"
        if @studentsArray.any? {|hashes| hashes["name"] == userinput}
            selectedStudent = @studentsArray.find {|hashes| hashes["name"] == userinput}
            system"clear"
            puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
            puts "Age: #{determineAge} and #{ageComment}"
            puts "Height: #{determineHeight}cm"
            puts "Bffl: #{determineBffl(@studentsArray, userinput).split.map(&:capitalize).join(' ')}"
            puts "Nemesis is: #{determineNemesis(@studentsArray, userinput).split.map(&:capitalize).join(' ')}"
            puts "Favourite dog breed: #{determineDog}"
            puts "Likes: #{interestsMethod}"
            puts "Dislikes: #{dislikesMethod}"
            puts ""
            puts "Press any key to return"
            STDIN.getch
            system"clear"
        #elsif userinput == 'randomise' 
            
        elsif userinput == "exit"
            File.write('test.json', JSON.pretty_generate(@studentsArray))
            exit
        elsif userinput == "help"
            help (@studentsArray)
        else
            puts "Invalid response"
            sleep(2.5)
            system"clear"
        end
    end
end

# selectedStudent = studentsArray.find {|hashes| hashes["name"] == userinput}
# puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
# puts "Age: #{determineAge} and #{ageComment}"
# puts "Height: #{determineHeight}cm"
# puts "Bffl: #{determineBffl(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
# puts "Nemesis is: #{determineNemesis(studentsArray, userinput).split.map(&:capitalize).join(' ')}"
# puts "Favourite dog breed: #{determineDog}"
# puts "Interests: #{interestsMethod}"
# puts "Dislikes: #{dislikesMethod}"
# puts ""
# puts "Type 'back' to go back to start screen or 'exit' to exit"
# userinput = gets.downcase.chomp
# if userinput == "back"
    
# elsif userinput == "exit"
#     exit
# else puts "incorrect response"
# end
# startScreen


# userinput = "blake doyle"
# puts studentsArray.find {|hashes| hashes["name"] == userinput}



main
