defmodule Neem.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    start_cowboy()
    children = []
    opts = [strategy: :one_for_one, name: Neem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def start_cowboy() do
    route1 = {"/", Neem.Web.PageHandler, :home}
    route2 = {"/about", Neem.Web.PageHandler, :about}
    route3 = {"/contact", Neem.Web.PageHandler, :contact}
    route4 = {:_, Neem.Web.PageHandler, :not_found}

    routes = [{:_, [route1, route2, route3, route4]}]
    dispatch = :cowboy_router.compile(routes)

    opts = [port: 5000]
    env = [dispatch: dispatch]

    case :cowboy.start_http(:http, 10, opts, [env: env]) do
      {:ok, _pid} -> IO.puts "Cowboy is now running. Go to http://localhost:5000"
      _ -> IO.puts "An error occurred when starting Cowboy server."
    end
  end
end
