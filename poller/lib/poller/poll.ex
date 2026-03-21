defmodule Poller.Poll do
  @moduledoc """
  Documentation for `Poller.Poll`.

  A `Poll` represents a collection of questions and votes for a specific district. It has a `district_id`, a list of `questions`, and a map of `votes` where the keys are choice IDs and the values are the number of votes for that choice.
  """

  alias __MODULE__

  defstruct(
    district_id: nil,
    questions: [],
    votes: %{}
  )

  @doc """
  Create a new poll
  """
  @spec new(number) :: Poll.t()
  def new(district_id) do
    %Poll{district_id: district_id}
  end

  def add_question(poll, question) do
    questions = [question | poll.questions]

    votes = init_votes(poll.votes, question)

    poll
    |> Map.put(:questions, questions)
    |> Map.put(:votes, votes)
  end

  defp init_votes(votes, question) do
    question.choices
    |> Enum.map(choices, fn choice -> {choice.id, 0} end)
    |> Enum.into(votes)
  end

  def vote(poll, choice_id) do
    do_vote(poll, choice_id, Map.has_key?(poll.votes, choice_id))
  end

  defp do_vote(poll, choice_id, _has_choice = true) do
    votes = Map.update!(poll.votes, choice_id, &(&1 + 1))
    Map.put(poll, :votes, votes)
  end

  defp do_vote(poll, _choice_id, _has_choice = false), do: poll
end
