require 'json'
require 'faker'
require 'io/console'
require 'rainbow'

# Read stored information on .json file
fJSON = File.read('test.json')
@studentsArray = JSON.parse(fJSON)

############################# list of methods ######################################

# looped home page
def homeScreen
    puts "######################################################################"
    puts "#                                                                    #"
    puts "#   ~~~~~~~~~~~~ Coder Academy 2018 Student Directory ~~~~~~~~~~~~   #"
    puts "#                                                                    #"
    puts "######################################################################"
    puts ""
    puts ""
    puts "Type the first name and last name of any student to search"
    puts ""
    puts "For a list of students, enter 'help'"
    puts "To randomise all student data, enter 'randomise!'"
    puts "To exit, type 'exit':"
end

# lists students alphabetically and capitalises each word of their names
def help
    system 'clear'
    puts Rainbow("Here is a list of all available student names:").blue
    puts ""
    @studentsArray.sort_by { |x| x["name"] }.each { |x| print x["name"].split.map(&:capitalize).join(' ') + ", "}
    puts ""
    puts ""
    main
end

# stop in place until user action is received
def escape
    puts ""
    puts Rainbow("Press anything to return").blue
    STDIN.getch
end

# randomises all values except name to a predetermined range or list
def randomise!
    
    system 'clear'

    # List of the available interests/dislikes
    interestarray = ["sleeping as a means to avoid responsibilities", "breathing", "crying", "having an existential crisis", "overthinking", "fishing for likes", "reading up on 'self'", "yelling at children", "eating crayons", "bendering to finish assignments", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people", "watching paint dry", "insulting people bigger than them", "sporks", "celery", "corriander", "eating peanut butter by the spoon", "hashes within an within a json file", "throwing a tantrum", "having the volume on an odd numnber", "memes", "people who chew loudly" "wetting themself", "Bunnings snags", "pineapple on pizza", "gambling the feature", "camping, because it's in-tents", "singing very, very badly", "tipping cows", "turning everything into a joke as a coping mechanism"]

   # List of all the available comments that are part of the user's age value    
    comment = ["looks fantastic", "looks terrible", "feels a million bucks", "has seen better days", "right knee clicks all the time when they walk for some reason", "could do back to back triathlons", "could fight you right now", "REALLY needs some beauty sleep", "is starting to forget things", "just needs a good cry", "has an old person smell about them"]
  
    # Generates a value for each key in the hash
    for eachitem in @studentsArray do

       # Selects a random age between 7 and 100
        eachitem["age"] = rand(7..100)

       # Selects a random height between 100 and 300 as cm
        eachitem["height"] = rand(100..300)

       # Uses the Faker gem to select a random dog breed
        eachitem["dog"] = Faker::Dog.breed

       # Searches through the comment array and adds it to the end of the students age
        eachitem["comment"] = comment.sample

       # Chooses a bffl name based on names available in the array of hashes
        eachitem["bffl"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
        
       # Chooses a nemesis name based on names available in the array of hashes
        eachitem["nemesis"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
        
        # ensures that each student, their bffl and their neme do not clash
        while eachitem["bffl"] == eachitem["name"] do
            eachitem["bffl"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
        end

        while eachitem["nemesis"] == eachitem["bffl"] || eachitem["nemesis"] == eachitem["name"] do
            eachitem["nemesis"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
        end
        
        # ensures that interests and dislikes do not clash
        tempinterests = interestarray.sample(4)
        eachitem["interests"] = "#{tempinterests[0]} and #{tempinterests[1]}"
        eachitem["dislikes"] = "#{tempinterests[2]} and #{tempinterests[3]}"
    end
end

# loop
def main
    loop do
        homeScreen
        # Asks the user to type in an input and standardises capitalisation
        userinput = gets.downcase.chomp
        
       # Checks if the input matches a name value of one of the hashes        
        if @studentsArray.any? {|hashes| hashes["name"] == userinput}
            selectedStudent = @studentsArray.find {|hashes| hashes["name"] == userinput}
            system"clear"
            
           # Displays the following information based on the key/value of the student hash            
            
           # Takes the name value, splits it, capitalizes the start of each word and joins it together           
           puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
            
           # Puts the age value which includes a comment            
            puts "Age: #{selectedStudent["age"]} and #{selectedStudent["comment"]}"
            
           # Puts the height as cm
            puts "Height: #{selectedStudent["height"]}cm"
                    
           # Takes the bffl value, splits it, capitalizes the start of each word and joins it together
            puts "Bffl: #{selectedStudent["bffl"].split.map(&:capitalize).join(' ')}"
            
           # Takes the nemesis value, splits it, capitalizes the start of each word and joins it together
            puts "Nemesis: #{selectedStudent["nemesis"].split.map(&:capitalize).join(' ')}"

           # Puts random dog breed
            puts "Favourite dog breed: #{selectedStudent["dog"]}"

           # Puts the value of the first 2 indexes of tempinterests as interests
            puts "Interests: #{selectedStudent["interests"]}"

           # Puts the value of the last 2 indexes of tempinterests as dislikes
            puts "Dislikes: #{selectedStudent["dislikes"]}"
            escape
            system 'clear'

        # quits the program after writing current database data back to .json file
        elsif userinput == "exit"
            File.write('test.json', JSON.pretty_generate(@studentsArray))
            puts "Program closing..."
            sleep(2)
            system 'clear'
            exit

       # Calls the help method which lists the possible names
        elsif userinput == "help"
            help
        
        # Randomizes all student data values apart from name
        elsif userinput == "randomise!"
            randomise!
            puts Rainbow("you have randomised all student data.").blue
            escape     
            system 'clear'   

       # Any other input is invalid and resets the main screen        
        else
            system 'clear'
            puts Rainbow("invalid command").red
            escape
            system 'clear'

        end
        
    end
end

# running the code

main