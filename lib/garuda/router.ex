defmodule Garuda.Router do
  defmacro __using__(_opts) do
    quote do
      import Garuda.Router
      import Assembly.Conn

      def call(conn) do
        content_for(conn.req_path, conn)
      end

      @before_compile Garuda.Router
    end
  end

  defmacro get(path, controller, action) do
    quote do
      defp content_for(unquote(path), var!(conn)) do
        apply(unquote(controller), :call, [var!(conn), unquote(action)])
      end
    end
  end

  defmacro __before_compile__(env) do
    quote do
      defp content_for(_, var!(conn)) do
        var!(conn)
        |> put_resp_code(404)
        |> put_resp_body("<h1>404 error</h1>")
      end
    end
  end
end
