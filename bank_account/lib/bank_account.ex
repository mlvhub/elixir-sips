defmodule BankAccount do
  def start do
    await []
  end

  def await(events) do
    receive do
      {:check_balance, pid} -> divulge_balance(pid, events)
      {:deposit, amount} -> events = deposit(amount, events)
      {:withdraw, amount} -> events = withdraw(amount, events)
    end
    await events
  end

  defp deposit(amount, events) do
    events ++ [{:deposit, amount}]
  end

  defp withdraw(amount, events) do
    events ++ [{:withdraw, amount}]
  end

  def divulge_balance(pid, events) do
    Process.send pid, {:balance, calculate_balance(events)}, []
  end

  defp calculate_balance(events) do
    deposits = sum(just_deposits(events))
    withdrawls = sum(just_withdrawls(events))
    deposits - withdrawls
  end

  defp just_deposits(events) do
    just_type(events, :deposit)
  end

  defp just_withdrawls(events) do
    just_type(events, :withdraw)
  end

  defp just_type(events, expected_type) do
    Enum.filter(events, fn {type, _} -> type == expected_type end)
  end

  defp sum(events) do
    Enum.reduce(events, 0, fn({_, amount}, acc) -> acc + amount end)
  end
end
