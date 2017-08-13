defmodule Demo.RunInstanceControllerTest do
  use Demo.ConnCase

  alias Demo.RunInstance
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, run_instance_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing runinstances"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, run_instance_path(conn, :new)
    assert html_response(conn, 200) =~ "New run instance"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, run_instance_path(conn, :create), run_instance: @valid_attrs
    assert redirected_to(conn) == run_instance_path(conn, :index)
    assert Repo.get_by(RunInstance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, run_instance_path(conn, :create), run_instance: @invalid_attrs
    assert html_response(conn, 200) =~ "New run instance"
  end

  test "shows chosen resource", %{conn: conn} do
    run_instance = Repo.insert! %RunInstance{}
    conn = get conn, run_instance_path(conn, :show, run_instance)
    assert html_response(conn, 200) =~ "Show run instance"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, run_instance_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    run_instance = Repo.insert! %RunInstance{}
    conn = get conn, run_instance_path(conn, :edit, run_instance)
    assert html_response(conn, 200) =~ "Edit run instance"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    run_instance = Repo.insert! %RunInstance{}
    conn = put conn, run_instance_path(conn, :update, run_instance), run_instance: @valid_attrs
    assert redirected_to(conn) == run_instance_path(conn, :show, run_instance)
    assert Repo.get_by(RunInstance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    run_instance = Repo.insert! %RunInstance{}
    conn = put conn, run_instance_path(conn, :update, run_instance), run_instance: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit run instance"
  end

  test "deletes chosen resource", %{conn: conn} do
    run_instance = Repo.insert! %RunInstance{}
    conn = delete conn, run_instance_path(conn, :delete, run_instance)
    assert redirected_to(conn) == run_instance_path(conn, :index)
    refute Repo.get(RunInstance, run_instance.id)
  end
end
