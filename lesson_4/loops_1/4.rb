loop do 
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'If you say so....'
end