defmodule SupervisedListServer.ListSupervisor do
  use Supervisor

  alias SupervisedListServer.ListServer

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(list) do
    child_processes = [worker(ListServer, list)]
    supervise child_processes, strategy: :one_for_one
  end
end
