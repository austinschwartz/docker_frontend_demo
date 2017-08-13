defmodule Demo.Run do
  use Demo.Web, :model

  schema "runs" do
    field :user, :string
    belongs_to :problem, Demo.Problem

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user, :problem_id])
    |> validate_required([:user, :problem_id])
    |> assoc_constraint(:problem)

  end
end
