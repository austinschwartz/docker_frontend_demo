defmodule Demo.Repo.Migrations.CreateProblem do
  use Ecto.Migration

  def change do
    create table(:problems) do
      add :title, :string
      add :desc, :string
      add :keywords, {:array, :string}

      timestamps()
    end

  end
end
