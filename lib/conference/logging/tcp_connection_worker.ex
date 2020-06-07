
defmodule Conference.Logging.TCPConnection.Worker do
    @moduledoc """
    Worker that reads log messages from a BlockingQueue and writes them to
    Logstash using a TCP connection.
    """
    def start_link(conn, queue) do
      spawn_link(fn -> consume_messages(conn, queue) end)
    end
    defp consume_messages(conn, queue) do
      msg = BlockingQueue.pop(queue)
      TCPConnection.send(conn, msg)
      consume_messages(conn, queue)
    end
  end
end