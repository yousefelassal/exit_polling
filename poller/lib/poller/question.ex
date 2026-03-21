defmodule Poller.Question do
  @moduledoc """
  Documentation for `Poller.Question`.

  A `Question` represents a single question in a poll. It has an `id`, a `description`, and a list of `choices`.
  """

  alias __MODULE__

  defstruct(
    id: nil,
    description: nil,
    choices: []
  )

  @doc """
  Create a new question

  Pass in the question id (number) and description (string) to create a new question struct.

  ## Examples

      iex> Poller.Question.new(1, "Who will win the election?")
      %Poller.Question{id: 1, description: "Who will win the election?"}
  """
  def new(id, description) do
    %Question{id: id, description: description}
  end

  @doc """
  Add a new choice

  Pass in a question and a choice to add the choice to the question's list of choices.

  ## Examples

      iex> question = Poller.Question.new(1, "Who will win the election?")
      iex> choice = Poller.Choice.new(1, "Candidate A", 0)
      iex> Poller.Question.add_choice(question, choice)
      %Poller.Question{id: 1, description: "Who will win the election?", choices: [%Poller.Choice{id: 1, description: "Candidate A", party: 0}]}
  """
  def add_choice(question, choice) do
    choices = [choice | question.choices]
    Map.put(question, :choices, choices)
  end
end
