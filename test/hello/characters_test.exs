defmodule Hello.CharactersTest do
  use Hello.DataCase

  alias Hello.Characters

  describe "skills" do
    alias Hello.Characters.Skill

    @valid_attrs %{grow: true, name: "some name", value: "some value"}
    @update_attrs %{grow: false, name: "some updated name", value: "some updated value"}
    @invalid_attrs %{grow: nil, name: nil, value: nil}

    def skill_fixture(attrs \\ %{}) do
      {:ok, skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characters.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Characters.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Characters.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert {:ok, %Skill{} = skill} = Characters.create_skill(@valid_attrs)
      assert skill.grow == true
      assert skill.name == "some name"
      assert skill.value == "some value"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{} = skill} = Characters.update_skill(skill, @update_attrs)
      assert skill.grow == false
      assert skill.name == "some updated name"
      assert skill.value == "some updated value"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_skill(skill, @invalid_attrs)
      assert skill == Characters.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Characters.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Characters.change_skill(skill)
    end
  end
end
