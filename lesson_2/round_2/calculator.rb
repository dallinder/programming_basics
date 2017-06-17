# ask the user for two numbers
# ask the user fr an operation
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

prompt('Welcome to the Calculator!')

prompt('What is your first number?')
num1 = gets.chomp
prompt("The first number is: #{num1}!")

prompt('What is your second number?')
num2 = gets.chomp
prompt("The second number is: #{num2}!")

prompt('What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide')
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

prompt("The result is #{result}")
      