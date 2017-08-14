defmodule Demo.Testcase do
  use Demo.Web, :model

  schema "testcases" do
    field :inputfile, :string
    field :outputfile, :string
    field :strength, :integer
    field :enabled, :boolean, default: false
    field :sample, :boolean, default: false
    belongs_to :problem, Demo.Problem

    timestamps()
  end

  def for_problem(query, problem_id) do
    from t in query, 
      where: t.problem_id == ^problem_id
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:inputfile, :outputfile, :strength, :enabled, :sample, :problem_id])
    |> validate_required([:inputfile, :outputfile, :strength, :enabled, :sample, :problem_id])
    |> assoc_constraint(:problem)
  end
end
