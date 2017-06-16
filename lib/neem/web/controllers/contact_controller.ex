defmodule Neem.Web.Controller.ContactController do
  import Assembly.Conn
  use Garuda.Controller

  def contact(conn, message) do
    conn
    |> put_resp_body("<img src='/images/logo.png'/><h1>Contact Page #{message}</h1>")
  end

  def call(conn, action) do
    apply(__MODULE__, action, [conn, "Hello from ContactController"])
  end
end
