## define functions

We can compile the `%{a: "a", b: "b"}` into beam as a whole, it's simple and rough enough. We can invoke `Map.get/2,3` function to get the value for given key.

But if we want compile one big variable into beam, it could trigger memory issue at compile time.

```elixir
defmodule CompileDataBeamBigVar do

  @big_big_map Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})

  def get(k) do
    Map.get(@big_big_map, k)
  end
end
```

We just want to compile the 100_000 pairs kv into beam and using `Map.get/2` to get value of the key.

The system memory will appear big spike when compile the module.

How to fix the issue?

### implementation

In this case, the mapping of key and value is constant, so we can use the sub functions:

```elixir
def get(1), do: 'value_1'

def get(2), do: 'value_2'

...
```

and the complete of module:

```elixir
defmodule CompileDataBeamDefineFunctions do

  @big_big_map Map.new(for i <- 1..100_000, do: {i, Enum.take_random(?a..?z, 10)})

  @big_big_map
  |> Enum.each(fn {k, v} ->
    def get(unquote(k)), do: unquote(v)
  end)

end
```

### performance compare

We can use the `timer` module to compare the performance:

```
# compile big var into beam directly
:timer.tc(fn -> for i <- 1..100_000, do: Elixir.CompileDataBeamBigVar.get i  end)

# define functions
:timer.tc(fn -> for i <- 1..100_000, do: Elixir.CompileDataBeamDefineFunctions.get i  end)
```

For external interface, perforance difference for two ways implementation could be ignored.
