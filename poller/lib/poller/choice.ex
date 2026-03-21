defmodule Poller.Choice do
  @moduledoc """
  Documentation for `Poller.Choice`.

  A `Choice` represents a single option that voters can select in a poll. It has an `id`, a `description`, and a `party` affiliation.
  """

  alias __MODULE__

  defstruct(
    id: nil,
    description: nil,
    party: nil
  )

  @doc """
  Create a new choice

  Pass in the choice id (number), description (string), and party (number) to create a new choice struct.

  ## Examples

      iex> Poller.Choice.new(1, "Choice 1", 0)
      %Poller.Choice{id: 1, description: "Choice 1", party: 0}
  """
  @spec new(number, String.t(), String.t()) :: Choice.t()
  def new(id, description, party) do
    %Choice{id: id, description: description, party: party}
  end
end
