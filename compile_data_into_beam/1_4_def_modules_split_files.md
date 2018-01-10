## define modules using multi-files

Smart like you and me who, the compile time does not decrease using define modules. Elixir could support compile the modules in parallel, but for the `define modules` we just have only one module file for Elixir. Elixir can not decide compile the `compile_data_beam_define_modules.ex` file using multi-process before compile it.

So, how about if we write multi-files? Fortunate, we could use [EEx](https://hexdocs.pm/eex/EEx.html) in Elixir.

### define eex file

```elixir
defmodule CompileDataBeamSplitFiles.N<%= number %> do

  <%= total%>
  |> CompileDataBeamSplitFiles.Help.split_map()
  |> Map.get(<%= number %>)
  |> Enum.map(fn {k, v} -> def get(unquote(k)), do: unquote(v) end)

end
```

the `number` and `total` are input parameter.

### the generator

```elixir
defmodule CompileDataBeamSplitFiles.Generator do

  def generate_multi_files(n) do
    for i <- 0..(n - 1) do
      content = EEx.eval_file("def_modules_split_files.eex", number: i, total: n)
      filename = "def_modules_split_files_#{i}.ex"
      File.write!(filename, content)
    end
  end
end
```

Since we didn't use mix manage the code, we should define a generator to generate the files. And if you use mix, you should define `before compile` in compilers of project.
