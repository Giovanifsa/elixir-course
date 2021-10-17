defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck creates 40 cards" do
    assert length(Cards.create_deck) == 40;
  end

  test "shuffling changes the deck order" do
    initial_deck = Cards.create_deck
    shuffled = Cards.shuffle(initial_deck)
    refute shuffled == initial_deck;
  end
end
