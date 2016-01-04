# Quickie Synth

An Elixir-based synthesizer. To use it, you can evaluate:

  QuickieSynth.Sound.play("C")

If you want to build a composition, you can do that like so:

  QuickieSynth.Composition.play(100, "CEGCEGAAB")

To run the keyboard UI, evaluate the following:

  QuickieSynth.UI.start

Then click in the window and play with the bottom two rows of your keyboard.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add quickie_synth to your list of dependencies in `mix.exs`:

        def deps do
          [{:quickie_synth, "~> 0.0.1"}]
        end

  2. Ensure quickie_synth is started before your application:

        def application do
          [applications: [:quickie_synth]]
        end
