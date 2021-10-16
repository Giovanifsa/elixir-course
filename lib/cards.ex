defmodule Cards do
  def create_deck do
    card_types = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    card_suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- card_suits, type <- card_types do
      "#{type} of #{suit}"
    end
  end

  def init do
    deck_var = create_deck()
    shuffle(deck_var)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
