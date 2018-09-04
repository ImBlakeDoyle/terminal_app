# class Student
#     def initialize
#     end
# end

class Student
    def initialize testvar
        testvar.each do |key,value|
            instance_variable_set("@#{key}", value)
            if self.class.count == 0
                self.class.define_method key do
                    instance_variable_get("@#{key}")
                end
            end
        end
        # add new class instance variable to Student
        self.class.all << self
    end

    @name = []

    def self.all
        @name
    end

    def self.count
        @name.count
    end

    def studenthash
        {}

 end
