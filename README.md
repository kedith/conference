# Conference

To prepare the db:
1. Check the config file and adjust your database settings
2. run 'mix ecto.migrate' to run all migrations or 'mix ecto.migrate -r Custom.Repo' for each repo with the coresponding name

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `conference` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:conference, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/conference](https://hexdocs.pm/conference).
