defmodule CompileDataBeamDefineFunctions do

  big_big_map = Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})

  big_big_map
  |> Enum.each(fn {k, v} ->
    def get(unquote(k)), do: unquote(v)
  end)

end
