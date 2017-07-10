DECK = ['2', 'hearts', 2], ['3', 'hearts', 3], ['4', 'hearts', 4],
       ['5', 'hearts', 5],
       ['6', 'hearts', 6], ['7', 'hearts', 7], ['8', 'hearts', 8],
       ['9', 'hearts', 9],
       ['10', 'hearts', 10], ['Jack', 'hearts', 10], ['Queen', 'hearts', 10],
       ['King', 'hearts', 10], ['Ace', 'hearts', 11],
       ['2', 'spades', 2], ['3', 'spades', 3], ['4', 'spades', 4],
       ['5', 'spades', 5],
       ['6', 'spades', 6], ['7', 'spades', 7], ['8', 'spades', 8],
       ['9', 'spades', 9],
       ['10', 'spades', 10], ['Jack', 'spades', 10], ['Queen', 'spades', 10],
       ['King', 'spades', 10], ['Ace', 'spades', 11],
       ['2', 'clubs', 2], ['3', 'clubs', 3], ['4', 'clubs', 4],
       ['5', 'clubs', 5],
       ['6', 'clubs', 6], ['7', 'clubs', 7], ['8', 'clubs', 8],
       ['9', 'clubs', 9],
       ['10', 'clubs', 10], ['Jack', 'clubs', 10], ['Queen', 'clubs', 10],
       ['King', 'clubs', 10], ['Ace', 'clubs', 11],
       ['2', 'diamonds', 2], ['3', 'diamonds', 3], ['4', 'diamonds', 4],
       ['5', 'diamonds', 5],
       ['6', 'diamonds', 6], ['7', 'diamonds', 7], ['8', 'diamonds', 8],
       ['9', 'diamonds', 9],
       ['10', 'diamonds', 10], ['Jack', 'diamonds', 10],
       ['Queen', 'diamonds', 10],
       ['King', 'diamonds', 10], ['Ace', 'diamonds', 11]

def prompt(message)
  puts "==> #{message}"
end

def initalize_deck
  DECK.shuffle
end

def cards_value(cards)
  value = (cards.map { |arr| arr[2] }).inject(:+)
  if cards.any? { |x| x.include?('A') } && value > 21
    value -= 10
  elsif cards.any? { |x| x.include?('A') } && value < 21
    value
  else
    value
  end
end

def player_card_display(cards)
  cards.map do |card|
    card.first(2).join(' of ')
  end
end

prompt("Welcome to 21!")

loop do
  p_cards = []
  dealer_cards = []
  new_deck = initalize_deck
  dealer_cards.push(new_deck.pop)
  p_cards.push(new_deck.pop)
  dealer_cards.push(new_deck.pop)
  p_cards.push(new_deck.pop)

  cards_value(p_cards)

  if cards_value(p_cards) == 21 && cards_value(dealer_cards) < 21
    prompt('You have Blackjack. You Win!')
    prompt('Do you want to play again? Type yes or no')
    answer = gets.chomp
    break unless answer == 'yes'
  elsif cards_value(p_cards) == 21 && cards_value(dealer_cards) == 21
    prompt('Both have 21. It is a push!')
    prompt('Do you want to play again? Type yes or no')
    answer = gets.chomp
    break unless answer == 'yes'
  end

  prompt("You have #{player_card_display(p_cards).join(', ')}")
  prompt("You have #{cards_value(p_cards)}")
  prompt("Dealer is showing #{dealer_cards[0][0]} of #{dealer_cards[0][1]}")

  loop do # player turn
    prompt('Will you hit or stay?')
    answer = gets.chomp
    if cards_value(p_cards) > 21
      prompt("You busted!")
      break
    end
    if answer == 'hit'
      p_cards.push(new_deck.pop)
      cards_value(p_cards)
      prompt("You have #{player_card_display(p_cards).join(', ')}")
      prompt("You now have #{cards_value(p_cards)}")
        if cards_value(p_cards) > 21
        prompt("You busted!")
        break
      end
    elsif answer == 'stay'
      break
    else
      prompt('Not a vaild choice. Please put hit or stay.')
    end
  end

  loop do # dealer turn
    prompt("Dealer has #{player_card_display(dealer_cards).join(', ')}")
    if cards_value(p_cards) > 21
      prompt("You busted!")
      break 
    elsif
      cards_value(dealer_cards) < 17
      dealer_cards.push(new_deck.pop)
    end
  end

  # results
  if cards_value(p_cards) > 21
    prompt('Dealer wins you busted!')
  elsif cards_value(dealer_cards) > 21
    prompt("You win! Dealer busted with #{cards_value(dealer_cards)}")
  elsif cards_value(dealer_cards) > cards_value(p_cards)
    prompt("Dealer has #{cards_value(dealer_cards)}.")
    prompt("You have #{cards_value(p_cards)}.")
    prompt("Dealer wins")
  elsif cards_value(dealer_cards) < cards_value(p_cards)
    prompt("Dealer has #{cards_value(dealer_cards)}.")
    prompt("You have #{cards_value(p_cards)}.")
    prompt("You Win!")
  else
    prompt("Dealer has #{cards_value(dealer_cards)}.")
    prompt("You have #{cards_value(p_cards)}.")
    prompt("It's a push!")
  end
  prompt('Do you want to play again? Type yes or no')
  answer = gets.chomp
  break unless answer == 'yes'
end

prompt('Thanks for playing!')
