defmodule Demo.Repo.Migrations.CreateRunInstance do
  use Ecto.Migration

  def change do
    create table(:runinstances) do
      add :user, :string
      add :status, :string
      add :message, :string
      add :diff, :text
      add :time, :integer
      add :run_id, references(:runs, on_delete: :nothing)
      add :testcase_id, references(:testcases, on_delete: :nothing)

      timestamps()
    end
    create index(:runinstances, [:run_id])
    create index(:runinstances, [:testcase_id])

  end
end
