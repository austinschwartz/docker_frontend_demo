defmodule Demo.RunInstance do
  use Demo.Web, :model

  schema "runinstances" do
    field :user, :string
    field :status, :string
    field :message, :string
    field :diff, :string, size: 4096
    belongs_to :run, Demo.Run
    belongs_to :testcase, Demo.Testcase

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user, :status, :message, :diff, :run_id, :testcase_id])
    |> validate_required([:user, :status, :message, :diff, :run_id, :testcase_id])
    #|> assoc_constraint(:run, :testcase)
    # not sure why this is breaking it?
  end
end
