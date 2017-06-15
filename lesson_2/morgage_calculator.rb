def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

def error
  puts 'That does not look like a vaild number. Please enter a positive number.'
end

prompt 'Welcome to the Mortgage Calculator! What is your name?'
name = gets.chomp
prompt "Hi #{name}!"

loop do
  loan_amount = ''
  loop do
    prompt 'How much is your loan for?'
    loan_amount = gets.chomp.to_i

    if valid_number?(loan_amount)
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

  loan_duration = ''
  loop do
    prompt 'What is the loan duration (in months)?'
    loan_duration = gets.chomp.to_i

    if valid_number?(loan_duration)
      break
    else
      error
    end
  end

  monthly_payment = loan_amount * (apr / (1 - (1 + apr)**-loan_duration))

  prompt 'Calculating your monthly payment...'
  sleep(3)
  prompt "Your monthly payment is #{monthly_payment.round(2)} for #{loan_duration} months."

  prompt 'Do you want to calculate another montly payment? (Y to continue): '
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thank you for using the Mortgage Calculator! Goodbye!'
