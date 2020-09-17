require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do
    hand = [3, "Queen"]
    score = blackjack_score(hand)
    expect(score).must_equal 13

    hand = [4, "King"]
    score = blackjack_score(hand)
    expect(score).must_equal 14

    hand = [5, "Jack"]
    score = blackjack_score(hand)
    expect(score).must_equal 15

    hand = [5, "Queen", 6]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = [3, "King", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 14


  end

  it 'calculates aces as 11 where it does not go over 21' do
    hand = ["Ace", 5]
    score = blackjack_score(hand)
    expect(score).must_equal 16

    hand = ["Ace", 10]
    score = blackjack_score(hand)
    expect(score).must_equal 21

    hand = ["Ace", "King"]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ["Ace", 5, 7]
    score = blackjack_score(hand)
    expect(score).must_equal 13

    hand = ["Ace", 5, "King"]
    score = blackjack_score(hand)
    expect(score).must_equal 16

    hand = ["Ace", 10, "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 12

    hand = ["Ace", "Jack", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 12

    hand = [3, "King", "Ace"]
    score = blackjack_score(hand)
    expect(score).must_equal 14
  end

  it 'raises an ArgumentError for invalid cards' do
    expect {
      blackjack_score(["k", 5, 2])
    }.must_raise ArgumentError

    expect {
      blackjack_score(["R", 2])
    }.must_raise ArgumentError

    expect {
      blackjack_score([85, 2])
    }.must_raise ArgumentError

    expect {
      blackjack_score([2])
    }.must_raise ArgumentError

    expect {
      blackjack_score()
    }.must_raise ArgumentError

    expect {
      blackjack_score([5, 1, 2, 3, 4, 5])
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    expect {
      blackjack_score([5, 10, "King"])
    }.must_raise ArgumentError

    expect {
    blackjack_score([5, "King", 7])
    }.must_raise ArgumentError

    expect {
      blackjack_score([3, "King", 10])
    }.must_raise ArgumentError
  end
end
