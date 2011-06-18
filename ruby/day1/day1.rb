# print the string "Hello, world"

puts "Hello, world."



# For the string "Hello, Ruby" find the index of the word "Ruby."

puts "Hello, Ruby".index "Ruby"



# Print your name ten times

puts "Clinton " * 10


# Print the string "This is sentence number 1," where the number 1 changes from 1 to 10.

i = 0

while i < 10
	i = i + 1
	puts "This is sentence number #{i}"
end




# Number guessing game

number = rand(10).to_i
guess = nil

while guess != number
	puts "Try to guess my number: "
	guess = gets.to_i
	puts "You guessed #{guess}"
	puts "Your guess was too low" if guess < number
	puts "Your guess was too high" if guess > number
	puts "Congratulations! You guess right!" if guess == number
end

