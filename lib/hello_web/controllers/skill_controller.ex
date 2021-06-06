defmodule HelloWeb.SkillController do
  use HelloWeb, :controller

  alias Hello.Characters
  alias Hello.Characters.Skill

  def index(conn, _params) do
    skills = Characters.list_skills()
    render(conn, "index.html", skills: skills)
  end

  def new(conn, _params) do
    changeset = Characters.change_skill(%Skill{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"skill" => skill_params}) do
    case Characters.create_skill(skill_params) do
      {:ok, skill} ->
        conn
        |> put_flash(:info, "Skill created successfully.")
        |> redirect(to: Routes.skill_path(conn, :show, skill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    skill = Characters.get_skill!(id)
    render(conn, "show.html", skill: skill)
  end

  def edit(conn, %{"id" => id}) do
    skill = Characters.get_skill!(id)
    changeset = Characters.change_skill(skill)
    render(conn, "edit.html", skill: skill, changeset: changeset)
  end

  def update(conn, %{"id" => id, "skill" => skill_params}) do
    skill = Characters.get_skill!(id)

    case Characters.update_skill(skill, skill_params) do
      {:ok, skill} ->
        conn
        |> put_flash(:info, "Skill updated successfully.")
        |> redirect(to: Routes.skill_path(conn, :show, skill))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", skill: skill, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    skill = Characters.get_skill!(id)
    {:ok, _skill} = Characters.delete_skill(skill)

    conn
    |> put_flash(:info, "Skill deleted successfully.")
    |> redirect(to: Routes.skill_path(conn, :index))
  end
end
