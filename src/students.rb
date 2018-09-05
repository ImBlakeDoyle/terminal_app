class Student
    # takes student hash arg
    def initialize hashes
        #for each key value pair in the hash
        hashes.each do |key,value|
            #create an instance variable in the form @key = value
            instance_variable_set("@#{key}", value)
            #instead of this we need do ONCE per session
            if self.class.count == 0
                self.class.define_method key do
                    instance_variable_get("@#{key}")
                end
            end
        end
        # adds self(eg @Ken Shu_shu) to array of all instances of class
        self.class.all << self
        # adds hashes of info into an array
        self.class.student_hashes << hashes
    end
 
    # our class variables
    @listofstudents = []
    @student_hashes = []
 
    # set our class methods
    class << self
 
        # lets us interact with @listofstudents since we cannot directly interact with class instance variables
        def all
            @listofstudents
        end
 
        # count
        def count
            @listofstudents.count
        end
 
        #interact with @student_hashes
        def student_hashes
            @student_hashes
        end

        def studentlist
            @student_hashes.each {|x| puts x["name"].split.map(&:capitalize).join(' ')}
        end

        def bffl
        end

        def randomise
            
        # def determineBffl(bfflArray, studentused) 
        #     bfflChosen = bfflArray.sample {|hash| hash["name"]} ["name"]
        #     if bfflChosen.downcase == studentused 
        #         bfflChosen = bfflArray.sample {|hash| hash["name"]} ["name"]
        #     else
        #         return bfflChosen
        #     end
        # end
    end

    
    # # randomise data
    # def determineDog
    #     favouriteDog = Faker::Dog.breed
    # end

    # # chooses two different interests at random
    # def interestsMethod
    #     interestarray = ["sleeping", "eating", "breathing", "crying", "having an existential crisis", "overthinking", "rock climbing", "fishing", "reading up on 'self'", "yelling at children", "eating crayons", "finger painting", "playing soccer", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people"]
    #     return "#{interestarray.sample(2).join(" and ")}"
    # end

    # def dislikesMethod
    #     interestarray = ["sleeping", "eating", "breathing", "crying", "having an existential crisis", "overthinking", "rock climbing", "fishing", "reading up on 'self'", "yelling at children", "eating crayons", "finger painting", "playing soccer", "singing really badly", "buying clothes they can't afford", '"cooking" toast', "power napping", "lifting heavy things repeatedly", "consuming enough coffee to kill most people"]
    #     return "#{interestarray.sample(2).join(" and ")}"
    # end

    # def determineHeight
    #     height = rand(100..300)
    # end


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
end

 