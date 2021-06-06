defmodule Hello.Characters.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :grow, :boolean, default: false
    field :name, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :value, :grow])
    |> validate_required([:name, :value, :grow])
  end
end
