defmodule Garuda.Controller do

  defmacro __using__(_opts) do
    quote do
      import Assembly.Conn

      def call(conn, action) do
        apply(__MODULE__, action, [conn, "Hello from Controller"])
      end

      defoverridable [call: 2]

      def render(conn, template, assigns) do
        view_module = Garuda.Controller.find_view_module(__MODULE__)
        body = view_module.render(template, assigns)
        put_resp_body(conn, body)
      end
    end
  end

  def find_view_module(module) do
    view_name = module
                |> Atom.to_string
                |> String.trim_trailing("Controller")
                |> Kernel.<>("View")
    Module.concat(Elixir, view_name)
  end
end
