defmodule Conference.Logging.TCPConnection do
 
    def start_link(host, port, queue, opts \\ [], timeout \\ 5000) do
      Connection.start_link(__MODULE__, {host, port, queue, opts, timeout})
    end
    def init({host, port, queue, opts, timeout}) do
      Conference.Logging.TCPConnection.Worker.start_link(self(), queue)
      state = %{host: host, port: port, opts: opts, timeout: timeout, sock: nil}
      {:connect, :init, state}
    end
end