defmodule Demo.RunTest do
  use Demo.ModelCase

  alias Demo.Run

  @valid_attrs %{user: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Run.changeset(%Run{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Run.changeset(%Run{}, @invalid_attrs)
    refute changeset.valid?
  end
end
