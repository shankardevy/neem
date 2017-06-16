defmodule Neem.Web.Router do
  use Garuda.Router
  alias Neem.Web.{PageController, ContactController}

  get "/", PageController, :home
  get "/about", PageController, :about
  get "/contact", ContactController, :contact
end
