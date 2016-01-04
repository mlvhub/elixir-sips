defmodule FridgeServer do
  use GenServer

  ### Public API
  def start_link(items \\ []) do
    {:ok, fridge} = GenServer.start_link FridgeServer, items, []
    fridge
  end

  def store(fridge, item) do
    perform_call(:store, fridge, item)
  end

  def take(fridge, item) do
    perform_call(:take, fridge, item)
  end

  ### Private Methods
  defp perform_call(action, fridge, item) do
    GenServer.call(fridge, {action, item})
  end

  ### GenServer API
  
  def init(items) do
    {:ok, items}
  end

  def handle_call({:store, item}, _from, items) do
    {:reply, :ok, [item|items]}
  end

  def handle_call({:take, item}, _from, items) do
    case Enum.member?(items, item) do
      true ->
        {:reply, {:ok, item}, items}
      false ->
        {:reply, :not_found, items}
    end
  end

end
