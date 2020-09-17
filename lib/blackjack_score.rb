# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  # taking care of some arguments errors
  if hand.length > 5
    raise ArgumentError.new("your hand has #{hand.length - 5} too many cards")
  elsif hand.length < 2
    raise ArgumentError.new("you need at least 2 cards")
  end

  sum = 0
  ace_count = hand.count("Ace")
  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("#{card} is not a valid card in your deck")
    elsif card == "Jack" || card == "Queen" || card == "King"
      sum += 10
    elsif card == "Ace"
      sum += 1
    else
      sum += card
    end
  end

  sum += 10 if sum <= 11 && ace_count > 0

  raise ArgumentError.new("BUST! The cards in your hand add up to a value greater than 21.") if sum > 21
  return sum
end
