require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals
INITAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

player_score = 0
computer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end



# rubocop:disable Metrics/AbcSize
def display_board(brd)
  
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITAL_MARKER }
end

def joinor(arr) # bonus question 1
  if arr.size <= 2
    arr.join(' or ')
  else
    arr[-1] = "or #{arr.last}"
    arr.join(', ')
  end
end

def player_places_pieces!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a vaild choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
      player_score += 1
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
      computer_score += 1
    end
  end
  nil
end


prompt("#{player_score}")
prompt("#{computer_score}")
loop do
  board = intialize_board

  loop do
    display_board(board)

    player_places_pieces!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  

  display_board(board)
  if someone_won?(board)
   "#{detect_winner(board)} won this round!"
  else
    prompt "It's a tie."
  end

  if player_score >= 5
    prompt('YOU WON')
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  elsif computer_score >= 5
    prompt('YOU LOST :(')
    prompt('YOU WON')
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end 
end

prompt "Thanks for playing Tic-Tac-Toe!"
