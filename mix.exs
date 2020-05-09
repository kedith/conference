defmodule Conference.MixProject do
  use Mix.Project

  def project do
    [
      app: :conference,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
