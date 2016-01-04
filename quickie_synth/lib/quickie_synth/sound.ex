defmodule QuickieSynth.Sound do
  def command(note) do
    {"play", ["-qn", "synth", "2","pluck", note]}
  end
  def play(note) do
    {cmd, args} = note |> command
    System.cmd(cmd, args)
  end
end
