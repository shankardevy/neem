defmodule Neem.Web.PageController do
  use Garuda.Controller

  def home(conn, message) do
    render(conn, "home.html", message: message)
  end

  def about(conn, _) do
    render(conn, "about.html", [])
  end
end
