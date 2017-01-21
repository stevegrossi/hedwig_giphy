# Hedwig Gif Me

[![Hex.pm](https://img.shields.io/hexpm/v/hedwig_giphy.svg)](https://hex.pm/packages/hedwig_giphy)

A [Hedwig](https://github.com/hedwig-im/hedwig) responder that returns an appropriate GIF from the Giphy API.

## Installation

Add `hedwig_giphy` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hedwig, "~> 1.0"},
    {:hedwig_giphy, "~> 0.1"}
  ]
end
```

## Usage

Add the responder to the `Hedwig.Robot`’s config section of your `config/config.exs`:

```elixir
config :alfred, Alfred.Robot,
  adapter: Hedwig.Adapters.Console,
  responders: [
    {HedwigGiphy.Responders.GifMe, []},
    # ...
  ]
```

## Configuration

There are some default configuration values you can override:

```elixir
config :hedwig_giphy,
  api_key: "dc6zaTOxFJmzC", # Giphy’s public beta API key
  rating: "pg-13" # y, g, pg, pg-13 or r
```

## Contributing

1. [Fork it!](http://github.com/stevegrossi/hedwig_giphy/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'A new feature!'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Open a new Pull Request
