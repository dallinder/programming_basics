VALID_CHOICES = %w(r p s l sp).freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'r' && second == ('s' || 'l')) ||
    (first == 'p' && second == ('r' || 'sp')) ||
    (first == 's' && second == ('p' || 'l')) ||
    (first == 'l' && second == ('p' || 'sp')) ||
    (first == 'sp' && second == ('s' || 'r'))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

player_score = 0
computer_score = 0

prompt('Welcome to Rock, Paper, Scissors, Lizard, Spock!')
prompt('You will play against the computer.')
prompt('First one to 5 wins, takes the game! ')

loop do
  choice = ''
  loop do
    prompt('Choose one: r = rock, p = paper, s = scissors, ' \
      'l = lizard, sp = spock')
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a vaild choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}. Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt("Your score is: #{player_score}." \
    "The computer score is: #{computer_score}")
  puts # blank line

  if player_score >= 5
    prompt('YOU WON!')
    prompt('Do you want to play again?')
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  elsif computer_score >= 5
    prompt('YOU LOST!')
    prompt('Do you want to play again?')
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

puts # blank line
prompt('Thank you for playing. Bye!')
