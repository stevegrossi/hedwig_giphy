defmodule HedwigGiphy.Mixfile do
  use Mix.Project

  def project do
    [app: :hedwig_giphy,
     version: "0.1.0",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    []
  end

  defp deps do
    [
      {:hedwig, "~> 1.0"},
      {:httpoison, "~> 0.11"},
      {:ex_doc, "~> 0.13", only: :dev},
      {:earmark, "~> 1.0.1", only: :dev},
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end

  defp description do
    """
    Respond with an appropriate GIF from Giphy.
    """
  end

  defp package do
    [
      maintainers: ["Steve Grossi"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/stevegrossi/hedwig_giphy",
        "Docs" => "https://hexdocs.pm/hedwig_giphy/"
      }
    ]
  end
end
