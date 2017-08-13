defmodule Demo.RunInstance do
  use Demo.Web, :model

  schema "runinstances" do
    belongs_to :run, Demo.Run
    belongs_to :testcase, Demo.Testcase

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
