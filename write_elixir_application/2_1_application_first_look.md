# Application First Look

A typical Elixir application will just look like:

```bash
$ tree
.
├── README.md
├── config
│   └── config.exs
├── deps
├── lib
│   └── first_look.ex
├── mix.exs
└── test
    ├── first_look_test.exs
    └── test_helper.exs

4 directories, 6 files
```


The configuration for this application will put into the `config` directory, this directory could includes different files which used in different environment.

The `deps` directory is used put dependencies of the application.

`lib` directory includes the source code of the application.

`test` directory is used put the unit test case files.

## mix.exs

One basic `mix.exs` file just like:

```elixir
defmodule FirstLook.MixProject do
  use Mix.Project

  def project do
    [
      app: :first_look,
      version: "0.1.0",
      elixir: "~> 1.7-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
```

### project

the `project` function is the main body for this `mix.exs` file, within it:

- app

    the name for this application

- version

    vsn for this application, it will be used by version upgrade

- elixir

    the version for elixir

- deps

    define the dependencies for this application
