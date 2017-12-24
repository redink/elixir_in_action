defmodule CompileDataBeamBigVar do

  @big_big_map Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})

  def get(k) do
    Map.get(@big_big_map, k)
  end

end
