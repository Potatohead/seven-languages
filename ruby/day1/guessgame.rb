number = rand(10) + 1
guess = 0
puts 'Guess a number between 1 and 10'
while guess != number
  guess = gets.to_i
  if guess < number
    puts 'Guess is too low'
  elsif guess > number
    puts 'Guess is too high'
  end
end
puts 'Congratulations'
