# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  # hand can only be between 2 & 5 cards
  if hand.length > 5
    raise ArgumentError.new("your hand has #{hand.length - 5} too many cards")
  elsif hand.length < 2
    raise ArgumentError.new("you need at least 2 cards")
  end

  score = 0
  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("#{card} is not a valid card in your deck")
    elsif card == "Jack" || card == "Queen" || card == "King"
      score += 10
    elsif card == "Ace"
      score += 1
    else
      score += card
    end
  end

  score += 10 if score <= 11 && hand.include?("Ace")

  raise ArgumentError.new("BUST! The cards in your hand add up to a value greater than 21.") if score > 21
  return score
end
