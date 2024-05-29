defmodule WebServer do
  require Logger


  @spec accept(char()) :: no_return()
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Accepting connections on port #{port}\n")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)

    {:ok, pid} = Task.Supervisor.start_child(WebServer.TaskSupervisor, fn -> serve(client) end)
    :ok = :gen_tcp.controlling_process(client, pid)

    loop_acceptor(socket)
  end

  defp serve(socket) do
   case read_line(socket) do
     {:ok, message} ->
       new_message = "From Server: " <> message
       write_line(new_message, socket)
       serve(socket)
     {:error, :closed} ->
       Logger.warning("Socket closed unexpectedly")
       :ok
   end
  end

  defp read_line(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, data} -> {:ok, data}
      {:error, :closed} -> {:error, :closed} # Handle the case where the socket is closed
    end
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end
end
