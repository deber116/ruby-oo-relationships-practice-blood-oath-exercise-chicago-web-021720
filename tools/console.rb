require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#Creating one instance of cult and follower, then running recruit_follower 
#to link the cult instance and the follower instance via BloodOath
new_cult = Cult.new("House of Edwards", "Texas", 2015, "tongue pop")
new_follower = Follower.new("Laganja", 27, "Yes gawwd!")
newer_follower = Follower.new("Gia Gunn", 28, "I am the boom boom Gunn")

#adding followers to cult via bloodoath
new_cult.recruit_follower(new_follower)
new_cult.recruit_follower(newer_follower)

#Adding another cult and follower with the associated BloodOath
another_cult = Cult.new("House Stark","Winterfell", 2010, "Winter is coming")
another_follower = Follower.new("Ned", 40, "Where's my head?")

another_cult.recruit_follower(another_follower)
new_cult.recruit_follower(another_follower)

population_test = new_cult.cult_population

test_follower = Follower.new("Hank", 42, "Damnit Bobby")

test_bloodoath = BloodOath.all[0]

#new cult with zero people to test least_popular
kardashian_cult = Cult.new("Kardashians","Texas", 2005, "Don't be f*cking rude!")

test_cult = Cult.new("Republicans","Winterfell", 2000, "We hate poor people")
test_cult2 = test_cult = Cult.new("Democrats","Winterfell", 1999, "We also hate poor people, but we won't say it.")

test_bo = BloodOath.new(test_follower,test_cult, Time.new(2000))
test_bo2 = BloodOath.new(new_follower,test_cult, Time.new(1999))
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
