loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp
  
  if answer == '4'
    puts 'Correct!'
    break
  else
    puts 'WRONG. TRY AGAIN!'
  end

end