defmodule Hello.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :value, :string
      add :grow, :boolean, default: false, null: false

      timestamps()
    end

  end
end
