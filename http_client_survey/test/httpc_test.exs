defmodule HttpcTest do
  use ExUnit.Case

  test "parsing the content of a page" do
    {:ok, {{_version, 200, _reason}, _headers, body}} = :httpc.request('http://example.com')
    assert Regex.match?(~r/illustrative examples/, to_string body) == true
  end
end
