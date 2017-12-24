defmodule CompileDataBeamDefineModules.Help do

  def split_map(map, n) do
    hash_map = map
    |> Enum.map(fn {k, _} = item ->
      {:erlang.phash2(k, n), item}
    end)
    for i <- 0..(n - 1) do
      {i, :proplists.get_all_values(i, hash_map)}
    end
  end
end

defmodule CompileDataBeamDefineModules do

  @slice_size 16
  big_big_map = Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})

  big_big_map
  |> CompileDataBeamDefineModules.Help.split_map(@slice_size)
  |> Enum.map(fn {i, map_list} ->
    defmodule Module.safe_concat([CompileDataBeamDefineModules, "#{i}"]) do
      map_list
      |> Enum.map(fn {k, v} ->
        def get(unquote(k)), do: unquote(v)
      end)
    end
  end)

  for i <- 0..(@slice_size - 1) do
    defp module_name(unquote(i)) do
      unquote([CompileDataBeamDefineModules, "#{i}"] |> Module.safe_concat())
    end
  end

  def get(k) do
    apply(module_name(:erlang.phash2(k, @slice_size)), :get, [k])
  end

end
