puts "USING a.inject(0) do ..."

a = [1, 2, 3, 4]
puts a

a.inject(0) do | a, b |
	puts "a : #{a}"
	puts "b : #{b}"
	a + b
end



puts "USING a.inject do ..."
a = [1, 2, 3, 4]
puts a

a.inject do | a, b |
	puts "a : #{a}"
	puts "b : #{b}"
	a + b
end
