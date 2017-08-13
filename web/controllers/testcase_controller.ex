defmodule Demo.TestcaseController do
  use Demo.Web, :controller

  alias Demo.Testcase

  def index(conn, _params) do
    testcases = Repo.all(Testcase)
    render(conn, "index.html", testcases: testcases)
  end

  def new(conn, _params) do
    changeset = Testcase.changeset(%Testcase{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"testcase" => testcase_params}) do
    changeset = Testcase.changeset(%Testcase{}, testcase_params)

    case Repo.insert(changeset) do
      {:ok, _testcase} ->
        conn
        |> put_flash(:info, "Testcase created successfully.")
        |> redirect(to: testcase_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    testcase = Repo.get!(Testcase, id)
    render(conn, "show.html", testcase: testcase)
  end

  def edit(conn, %{"id" => id}) do
    testcase = Repo.get!(Testcase, id)
    changeset = Testcase.changeset(testcase)
    render(conn, "edit.html", testcase: testcase, changeset: changeset)
  end

  def update(conn, %{"id" => id, "testcase" => testcase_params}) do
    testcase = Repo.get!(Testcase, id)
    changeset = Testcase.changeset(testcase, testcase_params)

    case Repo.update(changeset) do
      {:ok, testcase} ->
        conn
        |> put_flash(:info, "Testcase updated successfully.")
        |> redirect(to: testcase_path(conn, :show, testcase))
      {:error, changeset} ->
        render(conn, "edit.html", testcase: testcase, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    testcase = Repo.get!(Testcase, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(testcase)

    conn
    |> put_flash(:info, "Testcase deleted successfully.")
    |> redirect(to: testcase_path(conn, :index))
  end
end
