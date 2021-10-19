defmodule Colors do

  @doc """
    Creates a new color map containing Red and Blue as primary and secondary, respectively.
  """
  def create_colors do
    %{:primary => "Red", secondary: "Blue"};
  end

  @doc """
    Adds the tertiary key to the color map with `tertiary_color` as value.

  ## Examples

      iex> colors = Colors.create_colors
      iex> Colors.add_tertiary_color(colors, 'Yellow')
      %{primary: 'Red', secondary: 'Blue', tertiary: 'Yellow'}

  """
  def add_tertiary_color(colors, tertiary_color) do
    Map.put_new(colors, :tertiary, tertiary_color);
  end


  @doc """
    Updates the tertiary key on the color map with a new `tertiary_color`.

  ## Examples

      iex> colors = Colors.create_colors
      %{primary: 'Red', secondary: 'Blue'}
      iex> Colors.add_tertiary_color(colors, 'Yellow')
      %{primary: 'Red', secondary: 'Blue', tertiary: 'Yellow'}
      iex> Colors.update_tertiary_color(colors, 'Orange')
      %{primary: 'Red', secondary: 'Blue', tertiary: 'Orange'}
  """
  def update_tertiary_color(colors, tertiary_color) do
    %{colors | tertiary: tertiary_color};
  end
end
