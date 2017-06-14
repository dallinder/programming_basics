def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def error
  puts 'That does not look like a vaild number. Please enter a positive number.'
end

prompt 'Welcome to the Morgage Calculator! What is your name?'
name = gets.chomp
prompt "Hi #{name}!"

loop do
  p = ''
  loop do
    prompt 'How much is your loan for?'
    p = gets.chomp.to_i

    if valid_number?(p)
      break
    else
      error
    end
  end

  apr = ''
  loop do
    prompt 'What is your Annual Percentage Rate (APR)? Ex.: Use 5 for 5%.'
    apr = gets.chomp.to_f

    if valid_number?(apr)
      apr = (apr / 12) / 100
      break
    else
      error
    end
  end

  n = ''
  loop do
    prompt 'What is the loan duration (in months)?'
    n = gets.chomp.to_i

    if valid_number?(n)
      break
    else
      error
    end
  end

  m = p * (apr / (1 - (1 + apr)**-n))

  prompt 'Calculating your monthly payment...'
  sleep(3)
  prompt "Your monthly payment is #{m} for #{n} months."

  prompt 'Do you want to calculate another montly payment? (Y to continue): '
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for using the Morgage Calculator! Goodbye!'
