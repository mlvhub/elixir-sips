defmodule QuickieSynth.KeyboardMap do
    def note_for_key("z"), do: "G"
    def note_for_key("x"), do: "A"
    def note_for_key("c"), do: "B"
    def note_for_key("v"), do: "C"
    def note_for_key("b"), do: "D"
    def note_for_key("n"), do: "E"
    def note_for_key("m"), do: "F"
    def note_for_key(","), do: "G"
    def note_for_key("s"), do: "G#"
    def note_for_key("d"), do: "A#"
    def note_for_key("f"), do: "C#"
    def note_for_key("g"), do: "D#"
    def note_for_key("h"), do: "F#"
    def note_for_key("j"), do: "G#"
    def note_for_key(_),   do: :nomap
end
