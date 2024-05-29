defmodule WebServer.ConcurrentTest do
  use ExUnit.Case
  alias WebServer


  test "multiple requests" do
    port = 8080

    num_requests = 50

    tasks =
      for _ <- 1..num_requests do
        Task.async(fn -> send_request(port) end)
      end

    Enum.map(tasks, &Task.await(&1, :infinity))

    assert true
  end

  defp send_request(port) do
    case :gen_tcp.connect({127, 0, 0, 1}, port, [:binary, packet: :line, active: false, reuseaddr: true]) do
      {:ok, socket} ->
        :ok = :gen_tcp.send(socket, "Hello from client\n")
        case :gen_tcp.recv(socket, 0) do
          {:ok, response} ->
            IO.puts(response)
            :ok = :gen_tcp.close(socket)
          {:error, :closed} ->
            IO.puts("Connection to server closed unexpectedly")
            :ok
        end
      {:error, reason} -> IO.puts("Failed to connect: #{inspect(reason)}")
    end
  end

end
