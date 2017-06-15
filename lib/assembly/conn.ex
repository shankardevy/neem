defmodule Assembly.Conn do
  defstruct req_path: "",
            resp_header: [{"content-type", "text/html"}],
            resp_body: "",
            resp_code: 200

  def put_resp_body(conn, body) do
    %{conn | resp_body: body }
  end

  def put_resp_code(conn, code) do
    %{conn | resp_code: code }
  end
end
