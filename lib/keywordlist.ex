defmodule KeywordList do
  def create do
    [{:abc, 123}, {:def, 456}]
  end

  def match_abc_map_style(klist) do
    klist[:abc]
  end

  def match_def_tuple_style(klist) do
    [{:abc, 123}, {:def, matched}] = klist
    matched
  end
end
