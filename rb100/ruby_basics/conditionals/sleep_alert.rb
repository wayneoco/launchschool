status = ['awake', 'tired'].sample

a = if status == 'awake'
	"Be productive!"
	else
	"Go to sleep!"
end

puts a