require 'json'

fJSON = File.read('test.json')
studentsArray = JSON.parse(fJSON)

# Sets up an array of all the keys to be added
keys = %w(interests dislikes bffl nemesis dog age height comment)

# Sets a value of nil to each key that was set up
for eachkey in keys
  for hashes in studentsArray
      hashes[eachkey] = nil
  end
end

# Writes the keys & nil value pairs to each hash in the json file
File.write('test.json', JSON.pretty_generate(studentsArray))