defmodule Loopify.Mixfile do
  use Mix.Project

  def project do
    [app: :loopify,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Loopify, []},
     applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, path: "#{System.get_env("forks_path")}/phoenix", override: true},
     {:phoenix_pubsub, path: "#{System.get_env("forks_path")}/phoenix_pubsub", override: true},
     {:phoenix_ecto, path: "#{System.get_env("forks_path")}/phoenix_ecto", override: true},
     {:postgrex, ">= 0.0.0", override: true},
     {:phoenix_html, path: "#{System.get_env("forks_path")}/phoenix_html", override: true},
     {:phoenix_live_reload, path: "#{System.get_env("forks_path")}/phoenix_live_reload", override: true, only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0", override: true}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
