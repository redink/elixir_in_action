## define modules

As we can see, the beam file of `Elixir.CompileDataBeamDefineFunctions.beam` takes up 3.7M, it is too big for EVM. It can easily lead to compile and load problems. Now that we can define functions, why not define mulit-modules?

### implementation through hash keys

We can split the keys into given number blocks through hash the keys, just like the module `CompileDataBeamDefineModules`, this module includes three parts:

- split data

for this case, the data is a big map, we should split the map to several small map

- define modules

for every small map, we should compile them into different modules

- define get function

since we compile the big map into several modules, we need mapping data to the correct module

#### split data

the simplest way to split data is hash:

```elixir
  def split_map(map, n) do
    hash_map = map
    |> Enum.map(fn {k, _} = item ->
      {:erlang.phash2(k, n), item}
    end)
    for i <- 0..(n - 1) do
      {i, :proplists.get_all_values(i, hash_map)}
    end
  end
```

we could use hash the key into the big map into several parts, erlang support `phash2/2` for us.

### define modules

```elixir
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
```

yes, we can define module just like define functions, it is so easy.

### define get function


the simplest way to define function is:

```elixir
def get(k) do
   apply(Module.safe_concat([CompileDataBeamDefineModules, "#{:erang.phash2(k, n)}"]), :get, [k])
end
```

the `n` is the slice size.

But, there is a performance issue, it is too expensive to concat module name during runtime. We can define functions and define modules at compile time, why not compile the module name before runtime, thus we can get the module name during runtime through beam functions match operation fastly.

```elixir
  for i <- 0..(n - 1) do
    defp module_name(unquote(i)) do
      unquote([CompileDataBeamDefineModules, "#{i}"] |> Module.safe_concat())
    end
  end

  def get(k) do
    apply(module_name(:erlang.phash2(k, n)), :get, [k])
  end
```
