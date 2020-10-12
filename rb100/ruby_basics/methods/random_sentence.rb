def name(names)
	names.sample
end

def activity(activities)
	activities.sample
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def sentence(name, activity)
	"#{name} went #{activity} today!"
end

puts sentence(name(names), activity(activities))