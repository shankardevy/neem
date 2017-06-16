defmodule Neem.Web.ContactView do

  def render("contact.html", assigns) do
    template = """
      <img src='/images/logo.png'/>
      <h1>Contact Page <%= message %></h1>
    """
    EEx.eval_string template, assigns
  end
end
