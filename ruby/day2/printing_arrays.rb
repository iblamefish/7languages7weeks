a = (1..16).to_a

counter = 0
a.each do | item |
	print "#{item}, " # print doesn't add <CR> like puts
    counter = counter + 1
	if counter == 4
		counter = 0
		puts # move to next line if we're on the 4th count
	end
end


puts "--------"

a = (1..16).to_a

a.each_slice(4) do | slice |
	slice.each do | item |
		print "#{item}, "
	end
	puts
end


puts "-------"

# one liner - probably not the clearest thing in the world, but wanted to play :) 

a.each_slice(4) { | slice | slice.each { | item | print "#{item}, " } and puts }


puts "-------"

a.each_slice(4) { | slice | puts slice.join(', ') }
