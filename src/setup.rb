require 'json'

fJSON = File.read('test.json')
studentsArray = JSON.parse(fJSON)

keys = %w(interests dislikes bffl nemesis dog age height comment)

for eachkey in keys
  for hashes in studentsArray
      hashes[eachkey] = nil
  end
end

File.write('test.json', JSON.pretty_generate(studentsArray))