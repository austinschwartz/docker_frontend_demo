defmodule Demo.RunInstanceController do
  use Demo.Web, :controller

  alias Demo.RunInstance

  def index(conn, _params) do
    runinstances = Repo.all(RunInstance)
    render(conn, "index.html", runinstances: runinstances)
  end

  def new(conn, _params) do
    changeset = RunInstance.changeset(%RunInstance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"run_instance" => run_instance_params}) do
    changeset = RunInstance.changeset(%RunInstance{}, run_instance_params)

    case Repo.insert(changeset) do
      {:ok, _run_instance} ->
        conn
        |> put_flash(:info, "Run instance created successfully.")
        |> redirect(to: run_instance_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    run_instance = Repo.get!(RunInstance, id)
    render(conn, "show.html", run_instance: run_instance)
  end

  def edit(conn, %{"id" => id}) do
    run_instance = Repo.get!(RunInstance, id)
    changeset = RunInstance.changeset(run_instance)
    render(conn, "edit.html", run_instance: run_instance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "run_instance" => run_instance_params}) do
    run_instance = Repo.get!(RunInstance, id)
    changeset = RunInstance.changeset(run_instance, run_instance_params)

    case Repo.update(changeset) do
      {:ok, run_instance} ->
        conn
        |> put_flash(:info, "Run instance updated successfully.")
        |> redirect(to: run_instance_path(conn, :show, run_instance))
      {:error, changeset} ->
        render(conn, "edit.html", run_instance: run_instance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    run_instance = Repo.get!(RunInstance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(run_instance)

    conn
    |> put_flash(:info, "Run instance deleted successfully.")
    |> redirect(to: run_instance_path(conn, :index))
  end
end
