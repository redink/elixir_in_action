## `@expr`

As we all know, the Elixir module will compiled into beam file. Let's do it

```bash
$ elixirc compile_data_beam_1.ex
```

then we will get the beam file

```bash
$ ls Elixir.CompileDataBeam_1.beam
Elixir.CompileDataBeam_1.beam
```

Let's do something others, first convert the beam file to the erl source code through  [erlware_commons](https://github.com/erlware/erlware_commons)

```
$ iex -pa erlware_commons/_build/default/lib/erlware_commons/ebin/
iex(1)> :ec_compile.beam_to_erl_source(Elixir.CompileDataBeam_1, "compile_data_beam_1.erl")
:ok
```

so, we will get the erl file:

```erlang
$ cat compile_data_beam_1.erl
...
test_beam_data() -> #{a => <<"a">>, b => <<"b">>}.
...
```

then, let's compile the erlang file with `S` option

```bash
erlc -S compile_data_beam_1.erl
```

We will get the `compile_data_beam_1.S` file:

```
$ cat compile_data_beam_1.S
...
{function, test_beam_data, 0, 10}.
  {label,9}.
    {line,[{location,"compile_data_beam_1.erl",26}]}.
    {func_info,{atom,'Elixir.CompileDataBeam_1'},{atom,test_beam_data},0}.
  {label,10}.
    {move,{literal,#{a => <<"a">>,b => <<"b">>}},{x,0}}.
    return.
```

So far, we can see the data `%{a: "a", b: "b"}` will be treated as literal variable compile into the beam.
