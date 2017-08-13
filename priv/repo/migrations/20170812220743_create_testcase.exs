defmodule Demo.Repo.Migrations.CreateTestcase do
  use Ecto.Migration

  def change do
    create table(:testcases) do
      add :inputfile, :string
      add :outputfile, :string
      add :strength, :integer
      add :enabled, :boolean, default: false, null: false
      add :sample, :boolean, default: false, null: false
      add :problem_id, references(:problems, on_delete: :nothing)

      timestamps()
    end
    create index(:testcases, [:problem_id])

  end
end
