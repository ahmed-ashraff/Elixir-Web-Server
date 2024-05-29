defmodule WebServer.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # {Plug.Cowboy, scheme: :http, plug: WebServer.Router, options: [port: 8080]}
      {Task.Supervisor, name: WebServer.TaskSupervisor},
      Supervisor.child_spec({Task, fn -> WebServer.accept(8080) end}, restart: :permanent)
    ]

    opts = [strategy: :one_for_one, name: WebServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
