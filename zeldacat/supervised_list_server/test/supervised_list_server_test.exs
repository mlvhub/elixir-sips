defmodule SupervisedListServerTest do
  use ExUnit.Case
  doctest SupervisedListServer

  alias SupervisedListServer.ListServer

  # Clear the ListServer before each test
  setup do
    ListServer.start_link
    ListServer.clear
  end

  test "it starts out empty" do
    assert ListServer.items == []
  end

  @tag :skip
  test "it lets us add things to the list" do
    ListServer.add "book"
    assert ListServer.items == ["book"]
  end

  @tag :skip
  test "it lets us remove things from the list" do
    ListServer.add "book"
    ListServer.add "magazine"
    ListServer.remove "book"
    assert ListServer.items == ["magazine"]
  end
end
