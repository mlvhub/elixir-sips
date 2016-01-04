defmodule Zeldacat.Entity do
  use GenEvent

  ### Public API
  def init do
    GenEvent.start_link()
  end

  def add_component(pid, component, args) do
    GenEvent.add_handler(pid, component, args)
  end

  def notify(pid, event) do
    GenEvent.notify(pid, event)
  end
end
