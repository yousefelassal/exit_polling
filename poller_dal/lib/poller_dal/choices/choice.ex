defmodule PollerDal.Choices.Choice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "choices" do
    field(:description, :string)
    belongs_to(:question, PollerDal.Questions.Question)
    
    timestamps()
  end
  
  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:description, :question_id])
    |> validate_required([:description, :question_id])
    |> assoc_constraint(:question)
  end
end
