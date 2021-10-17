defmodule Cards do
  @moduledoc """
    Functions that allows the handling cards and decks
  """

  @doc """
    Creates a new list of strings that contains a deck of cards.

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Six of Spades", "Seven of Spades", "Eight of Spades",
      "Nine of Spades", "Ten of Spades", "Ace of Clubs", "Two of Clubs",
      "Three of Clubs", "Four of Clubs", "Five of Clubs", "Six of Clubs",
      "Seven of Clubs", "Eight of Clubs", "Nine of Clubs", "Ten of Clubs",
      "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts",
      "Five of Hearts", "Six of Hearts", "Seven of Hearts", "Eight of Hearts",
      "Nine of Hearts", "Ten of Hearts", "Ace of Diamonds", "Two of Diamonds",
      "Three of Diamonds", "Four of Diamonds", "Five of Diamonds", "Six of Diamonds",
      "Seven of Diamonds", "Eight of Diamonds", "Nine of Diamonds",
      "Ten of Diamonds"]

  """
  def create_deck do
    card_types = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    card_suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- card_suits, type <- card_types do
      "#{type} of #{suit}"
    end
  end

  @doc """
    Checks if a card is contained in the deck list.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      :true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Shuffles a deck with random positions.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns the deck divided into the hand (with given `hand_size`),
    and the remaining cards.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _remaining_deck} = Cards.deal(deck, 3)
      iex> hand
      ["Ace of Spades", "Two of Spades", "Three of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a deck of cards on the file system.
  """
  def save(deck, filename) do
    object_write = :erlang.term_to_binary(deck)
    File.write(filename, object_write)
  end

  @doc """
    Loads a deck of cards from the file system.
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "The file does not exist (#{reason})"
    end
  end

  @doc """
    AIO function that creates a deck, shuffles it and returns a
    hand with given `hand_size` plus the remaining cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
