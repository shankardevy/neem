defmodule Neem.Web.ContactController do
  import Assembly.Conn
  use Garuda.Controller

  def contact(conn, message) do
    render(conn, "contact.html", message: message)
  end

  def call(conn, action) do
    apply(__MODULE__, action, [conn, "Hello from ContactController"])
  end
end
