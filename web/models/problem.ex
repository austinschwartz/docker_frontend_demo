defmodule Demo.Problem do
  use Demo.Web, :model

  schema "problems" do
    field :title, :string
    field :desc, :string
    field :keywords, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :desc, :keywords])
    |> validate_required([:title, :desc])
  end
end
