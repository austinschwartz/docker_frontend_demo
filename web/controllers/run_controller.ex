defmodule Demo.RunController do
  use Demo.Web, :controller

  alias Demo.Run

  def index(conn, _params) do
    runs = Repo.all(Run)
    render(conn, "index.html", runs: runs)
  end

  def new(conn, _params) do
    changeset = Run.changeset(%Run{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"run" => run_params}) do
    changeset = Run.changeset(%Run{}, run_params)

    case Repo.insert(changeset) do
      {:ok, _run} ->
        conn
        |> put_flash(:info, "Run created successfully.")
        |> redirect(to: run_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    run = Repo.get!(Run, id)
    render(conn, "show.html", run: run)
  end

  def edit(conn, %{"id" => id}) do
    run = Repo.get!(Run, id)
    changeset = Run.changeset(run)
    render(conn, "edit.html", run: run, changeset: changeset)
  end

  def update(conn, %{"id" => id, "run" => run_params}) do
    run = Repo.get!(Run, id)
    changeset = Run.changeset(run, run_params)

    case Repo.update(changeset) do
      {:ok, run} ->
        conn
        |> put_flash(:info, "Run updated successfully.")
        |> redirect(to: run_path(conn, :show, run))
      {:error, changeset} ->
        render(conn, "edit.html", run: run, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    run = Repo.get!(Run, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(run)

    conn
    |> put_flash(:info, "Run deleted successfully.")
    |> redirect(to: run_path(conn, :index))
  end

  def start(%{
      problem_id: problem_id,
      code: code,
      language: language,
      username: username
    }) do
      {:ok, run} = 
    Run.changeset(%Demo.Run{}, %{"user" => username, "problem_id" => problem_id}) |> Demo.Repo.insert()

    temp_dir = "#{Juice.testcases_src}/0000#{problem_id}/#{username}"

    File.mkdir(temp_dir)
    File.chmod(temp_dir, 0o755)

    temp_file = "#{temp_dir}/Main.java"
    File.touch temp_file
    File.chmod(temp_file, 0o755)

    File.write(temp_file, code)

    File.close temp_file

    IO.inspect "creating run #{run.id}"
    out = Demo.Testcase 
      |> Demo.Testcase.for_problem(problem_id) 
      |> Demo.Repo.all
      |> Enum.each(
        fn(testcase) ->
          spawn fn ->
            Demo.RunInstanceController.build(
              username: username, 
              problem_id: problem_id, 
              testcase_id: testcase.id,
              temp_dir: temp_dir,
              temp_file: temp_file,
              language: language,
              run_id: run.id
            )
          end
        end) 
    IO.inspect out
    run
  end
end
