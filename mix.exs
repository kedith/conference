defmodule Conference.MixProject do
  use Mix.Project

  def project do
    [
      app: :conference,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      test: ["ecto.create --quiet",
        "ecto.migrate",
        "test"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Conference.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"},
      {:plug, "~> 1.6"},
      {:cowboy, "~> 2.4"},
      {:git_hooks, "~> 0.4.0", only: [:test, :dev], runtime: false},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 3.0"},
      {:joken, "~> 2.2.0"},
      {:jsonapi, "~> 1.3"},
    ]
  end
end
