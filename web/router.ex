defmodule Demo.Router do
  use Demo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Demo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/testcases", TestcaseController
    resources "/problems", ProblemController 
    resources "/runs", RunController  
    resources "/runinstances", RunInstanceController
  end

  scope "/problems", Demo do
    pipe_through :browser

    post "/:id", ProblemController, :submit
    get "/:id/run/:test_id", ProblemController, :test
  end

end
