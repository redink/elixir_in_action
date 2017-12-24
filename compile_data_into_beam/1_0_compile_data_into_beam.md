# compile data into beam

For beam, we have some ways to store some data in EVM(Erlang virtual machine), we can use `process dict`, `ETS table`.

The Macro from Elixir provides for compile data into beam at compile time. For a simple example, we can use `@expr`

```elixir
$ cat compile_data_beam_1.ex
defmodule CompileDataBeam_1 do

  @beam_data %{a: "a", b: "b"}

  def test_beam_data do
    @beam_data
  end

end
```

Then we call the `CompileDataBeam_1.test_beam_data()` function and will get the data `%{a: "a", b: "b"}`. But, how it works? Let's continue:
