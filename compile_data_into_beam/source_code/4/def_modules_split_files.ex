defmodule CompileDataBeamSplitFiles.Help do

  def generate_big_map() do
    Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})
  end

  def split_map(n) do
    split_map(generate_big_map(), n)
  end

  def split_map(map, n) do
    hash_map = map
    |> Enum.map(fn {k, _} = item ->
      {:erlang.phash2(k, n), item}
    end)
    for i <- 0..(n - 1) do
      {i, :proplists.get_all_values(i, hash_map)}
    end
    |> Map.new()
  end
end

defmodule CompileDataBeamSplitFiles do

  @slice_size 4

  for i <- 0..(@slice_size - 1) do
    defp module_name(unquote(i)) do
      unquote([CompileDataBeamSplitFiles, "N#{i}"] |> Module.concat())
    end
  end

  def get(k) do
    apply(module_name(:erlang.phash2(k, @slice_size)), :get, [k])
  end

end
