defmodule PollerDal.Choices do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Choices.Choice

  def list_choices_by_question_id(question_id) do
    from(c in Choice, where: c.question_id == ^question_id)
    |> Repo.all()
  end
  
  def list_choices_by_district_id(district_id) do
    from(c in Choice,
      join: q in assoc(c, :question),
      where: q.district_id == ^district_id
    )
    |> Repo.all()
  end
  
  def list_choices_by_choice_ids(choice_ids) do
    from(c in Choice, where: c.id in ^choice_ids)
    |> Repo.all()
  end

  def list_choices, do: Repo.all(Choice)

  def get_choice!(id), do: Repo.get!(Choice, id)

  def create_choice(attrs) do
    %Choice{}
    |> Choice.changeset(attrs)
    |> Repo.insert()
  end

  def update_choice(%Choice{} = choice, attrs) do
    choice
    |> Choice.changeset(attrs)
    |> Repo.update()
  end

  def delete_choice(%Choice{} = choice) do
    Repo.delete(choice)
  end
  
  def change_choice(%Choice{} = choice) do
    Choice.changeset(choice, %{})
  end
end
