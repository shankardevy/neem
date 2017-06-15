defmodule Garuda.CowboyHandler do
  def init({:tcp, :http}, req, router) do
    {:ok, req, router}
  end

  def handle(req, router) do
    { path, req } = :cowboy_req.path(req)
    conn = %Assembly.Conn{req_path: path}
    conn = router.call(conn)

    { :ok, resp } = :cowboy_req.reply(
                      conn.resp_code,
                      conn.resp_header,
                      conn.resp_body,
                      req
                    )
    {:ok, resp, router}
  end

  def terminate(_reason, _req, _state) do
    :ok
  end
end
