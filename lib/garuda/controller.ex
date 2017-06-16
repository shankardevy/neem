defmodule Garuda.Controller do

  defmacro __using__(_opts) do
    quote do
      def call(conn, action) do
        apply(__MODULE__, action, [conn, "Hello from Controller"])
      end
      defoverridable [call: 2]
    end
  end
end
