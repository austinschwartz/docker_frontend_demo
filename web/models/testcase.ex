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

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:inputfile, :outputfile, :strength, :enabled, :sample])
    |> validate_required([:inputfile, :outputfile, :strength, :enabled, :sample])
  end
end
