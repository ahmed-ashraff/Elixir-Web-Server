defmodule WebServer.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Logger,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  # Get request to localhost:8000
  get "/", do: send_resp(conn, 200, "OK")

  # name will have the string after slash
  get "/:name", do: send_resp(conn, 200, "Welcome #{name}")

  # default case for requests that match nothing above
  match _, do: send_resp(conn, 404, "Not Found")

end
