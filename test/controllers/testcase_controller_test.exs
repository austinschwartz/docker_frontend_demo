defmodule Demo.TestcaseControllerTest do
  use Demo.ConnCase

  alias Demo.Testcase
  @valid_attrs %{enabled: true, inputfile: "some content", outputfile: "some content", sample: true, strength: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, testcase_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing testcases"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, testcase_path(conn, :new)
    assert html_response(conn, 200) =~ "New testcase"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, testcase_path(conn, :create), testcase: @valid_attrs
    assert redirected_to(conn) == testcase_path(conn, :index)
    assert Repo.get_by(Testcase, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, testcase_path(conn, :create), testcase: @invalid_attrs
    assert html_response(conn, 200) =~ "New testcase"
  end

  test "shows chosen resource", %{conn: conn} do
    testcase = Repo.insert! %Testcase{}
    conn = get conn, testcase_path(conn, :show, testcase)
    assert html_response(conn, 200) =~ "Show testcase"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, testcase_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    testcase = Repo.insert! %Testcase{}
    conn = get conn, testcase_path(conn, :edit, testcase)
    assert html_response(conn, 200) =~ "Edit testcase"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    testcase = Repo.insert! %Testcase{}
    conn = put conn, testcase_path(conn, :update, testcase), testcase: @valid_attrs
    assert redirected_to(conn) == testcase_path(conn, :show, testcase)
    assert Repo.get_by(Testcase, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    testcase = Repo.insert! %Testcase{}
    conn = put conn, testcase_path(conn, :update, testcase), testcase: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit testcase"
  end

  test "deletes chosen resource", %{conn: conn} do
    testcase = Repo.insert! %Testcase{}
    conn = delete conn, testcase_path(conn, :delete, testcase)
    assert redirected_to(conn) == testcase_path(conn, :index)
    refute Repo.get(Testcase, testcase.id)
  end
end
