defmodule Demo.Repo.Migrations.CreateRun do
  use Ecto.Migration

  def change do
    create table(:runs) do
      add :user, :string
      add :problem_id, references(:problems, on_delete: :nothing)

      timestamps()
    end
    create index(:runs, [:problem_id])

  end
end
