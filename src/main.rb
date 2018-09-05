require 'json'
require 'faker'
require 'io/console'

# Read stored information on .json file
fJSON = File.read('test.json')
@studentsArray = JSON.parse(fJSON)

############################# list of methods ######################################

# welcome landing page
def startScreen
   puts "~~~~~Welcome to the Coder Academy 2018 Student Directory!~~~~~"
   puts ""
   puts ""
   puts "Type the first name and last name of any student to begin"
   puts ""
   puts "For a list of students, type 'help'"
   puts "To exit, type 'exit'"
end

# lists students
def help
   system"clear"
   puts "Here is a list of all available student names:"
   puts ""
   @studentsArray.each {|x| print x["name"].split.map(&:capitalize).join(' ') + ", "}
   puts ""
   puts ""
   main
end

# loop
def main
   loop do
       startScreen
       userinput = gets.downcase.chomp
       system"clear"
       if @studentsArray.any? {|hashes| hashes["name"] == userinput}
           selectedStudent = @studentsArray.find {|hashes| hashes["name"] == userinput}
           system"clear"
           puts "Name: #{selectedStudent["name"].split.map(&:capitalize).join(' ')}"
           puts "Age: #{selectedStudent["age"]} and #{selectedStudent["comment"]}"
           puts "Height: #{selectedStudent["height"]}cm"
           puts "Bffl: #{selectedStudent["bffl"].split.map(&:capitalize).join(' ')}"
           puts "Nemesis is: #{selectedStudent["nemesis"].split.map(&:capitalize).join(' ')}"
           puts "Favourite dog breed: #{selectedStudent["dog"]}, but anything is better than a cat"
           puts "Interests: #{selectedStudent["interests"]}"
           puts "Dislikes: #{selectedStudent["dislikes"]}"
           puts ""
           puts "Press anything to return"
           STDIN.getch
           system"clear"
       elsif userinput == "exit"
           File.write('test.json', JSON.pretty_generate(@studentsArray))
           exit
       elsif userinput == "help"
           puts "here"
           help
       else
           puts "invalid command"
           sleep(2.5)
           system"clear"
       end
   end
end

# randomises all values except name
def randomise!
   interestarray = ["sleeping as a means to avoid responsibilities", "breathing", "crying", "having an existential crisis", "overthinking", "fishing for likes", "reading up on 'self'", "yelling at children", "eating crayons", "bendering to finish assignments", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people", "watching paint dry", "insulting people bigger than them", "sporks", "celery", "corriander", "eating peanut butter by the spoon", "hashes within an within a json file", "throwing a tantrum", "having the volume on an odd numnber", "memes", "people who chew loudly" "wetting themself", "Bunnings snags", "pineapple on pizza", "gambling the feature", "camping, because it's in-tents", "singing very, very badly", "tipping cows", "turning everything into a joke as a coping mechanism"]
   comment = ["looks fantastic", "looks terrible", "feels a million bucks", "has seen better days", "right knee clicks all the time when they walk for some reason", "could do back to back triathlons", "could fight you right now", "REALLY needs some beauty sleep", "is starting to forget things", "just needs a good cry", "has an old person smell about them"]
   for eachitem in @studentsArray do
       eachitem["age"] = rand(7..100)
       eachitem["height"] = rand(100..300)
       eachitem["dog"] = Faker::Dog.breed
       eachitem["comment"] = comment.sample
       eachitem["bffl"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
       eachitem["nemesis"] = @studentsArray.sample {|hash| hash["name"]} ["name"]

       while eachitem["bffl"] == eachitem["name"] do
           eachitem["bffl"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
       end

       while eachitem["nemesis"] == eachitem["bffl"] || eachitem["nemesis"] == eachitem["name"] do
           eachitem["nemesis"] = @studentsArray.sample {|hash| hash["name"]} ["name"]
       end

       tempinterests = interestarray.sample(4)
       eachitem["interests"] = "#{tempinterests[0]} and #{tempinterests[1]}"
       eachitem["dislikes"] = "#{tempinterests[2]} and #{tempinterests[3]}"
   end
end

# running the code
randomise!
main