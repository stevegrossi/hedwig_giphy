defmodule HedwigGiphy.Responders.GifMe do
  @moduledoc """
  Searches the Giphy public API and return the URL
  of a GIF matching the search term.
  """

  use Hedwig.Responder
  alias Hedwig.Message

  @base_url "http://api.giphy.com/v1/gifs/translate"
  @default_api_key "dc6zaTOxFJmzC" # Giphy’s public beta API key
  @api_client Application.get_env(:hedwig_giphy, :api_client, HedwigGiphy.APIClient)
  @default_rating "pg-13"

  @usage """
  gif me <term> - Replies with a GIF URL matching the term
  """
  hear ~r/gif me (.+)/i, %Message{matches: %{1 => search_term}} = msg do
    send(msg, get_gif_url(search_term))
  end

  defp get_gif_url(search_term) do
    search_term
    |> build_url
    |> make_request
    |> handle_response
  end

  defp build_url(search_term) do
    @base_url <> "?" <> build_query_string(search_term)
  end

  defp build_query_string(search_term) do
    URI.encode_query(%{
      s: search_term,
      api_key: Application.get_env(:hedwig_giphy, :api_key, @default_api_key),
      rating: Application.get_env(:hedwig_giphy, :rating, @default_rating)
    })
  end

  defp make_request(api_url) do
    @api_client.get(api_url)
  end

  defp handle_response({:ok, response}) do
    response
    |> get_in(["data", "images", "original", "url"])
  end
  defp handle_response({:error, _reason}) do
    "I’m sorry, Giphy isn’t talking to me right now."
  end
end
