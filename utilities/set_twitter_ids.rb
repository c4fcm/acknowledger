require '../config/environment'
require 'json'

Person.all.each do |person|
  if !person.nil? and !person.twitter_data.nil? and person.twitter_data.length>0
    person.twitter_id = JSON.parse(person.twitter_data)['id'].to_i
    person.save!
    puts person.name + " o"
  else
    begin 
      puts person.name + " x"
    rescue NoMethodError
      puts person
    end
  end
end
