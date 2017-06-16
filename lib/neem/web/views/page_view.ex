defmodule Neem.Web.PageView do

  def render("about.html", assigns) do
    template = """
      <img src='/images/logo.png'/>
      <h1>About Page</h1>
    """
    EEx.eval_string template
  end

  def render("home.html", assigns) do
    template = """
      <img src='/images/logo.png'/>
      <h1>Home Page <%= message %></h1>
    """
    EEx.eval_string template, assigns
  end
end
