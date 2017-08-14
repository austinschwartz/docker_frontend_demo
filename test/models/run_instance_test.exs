defmodule Demo.RunInstanceTest do
  use Demo.ModelCase

  alias Demo.RunInstance

  @valid_attrs %{diff: "some content", message: "some content", status: "some content", time: 42, user: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RunInstance.changeset(%RunInstance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RunInstance.changeset(%RunInstance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
