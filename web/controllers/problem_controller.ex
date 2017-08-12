defmodule Demo.ProblemController do
  use Demo.Web, :controller

  alias Demo.Router
  import Demo.Router.Helpers

  def problem(conn, _params) do
    render(conn, "problem.html", id: _params["id"])
  end

  def submit(conn, _params) do
    IO.puts "hello frmo submit"
    IO.inspect _params
    {:ok, body, conn} = Plug.Conn.read_body(conn) 
    IO.inspect body
    redirect conn, to: "/problem/#{_params["id"]}/run/5"
    #render(conn, "tests.html", id: _params["id"])
  end

  def test(conn, _params) do
    render(conn, "tests.html", id: _params["id"])
  end
end
