defmodule WebServer.RouterTest do
  use ExUnit.Case, async: true

  use Plug.Test

  @opts WebServer.Router.init([])
  
  test "return OK" do
    build_conn = conn(:get, "/")
    conn = WebServer.Router.call(build_conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end

end
