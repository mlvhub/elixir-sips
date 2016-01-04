defmodule Zeldacat.XYComponent do
  use GenEvent

  alias Zeldacat.XYComponent

  ### Public API
  #position is a tuple whose firt element is the x component and whose second element is the y component
  def get_position(entity) do
    GenEvent.call(entity, __MODULE__, :get_position)
  end

  ### GenEvent API

  def init(position) do
    {:ok, position}
  end

  def handle_event({:move, {:y, new_y}}, {x, _}) do
    {:ok, {x, new_y}}
  end

  def handle_event({:move, {:x, new_x}}, {_, y}) do
    {:ok, {new_x, y}}
  end

  def handle_call(:get_position, position) do
    {:ok, position, position}
  end
end
