defmodule Coference.Logging.JsonLoggerTCP do
    # ...

     # Standard tcp_connection socket options
   @connection_opts [active: false, mode: :binary]

    defp configure(name, opts) do
      env = Application.get_env(:logger, name, [])
      opts = Keyword.merge(env, opts)
      Application.put_env(:logger, name, opts)
      level = Keyword.get(opts, :level, :info)
      host = Keyword.get(opts, :host)
      port = Keyword.get(opts, :port)
      queue = Keyword.get(opts, :queue) || nil
      buffer_size = Keyword.get(opts, :buffer_size) || 10_000
      workers = Keyword.get(opts, :workers) || 4
      worker_pool = Keyword.get(opts, :worker_pool) || nil
  
       # Create new queue
      if queue == nil do
        {:ok, queue} = BlockingQueue.start_link(buffer_size)
      end
      # Close previous worker pool
      if worker_pool != nil do
        :ok = Supervisor.stop(worker_pool)
      end

    # Create worker pool
    children = 1..workers |> Enum.map(& tcp_worker(&1, host, port, queue))
    {:ok, worker_pool} = Supervisor.start_link(children,
    [strategy: :one_for_one])
      
    # Store opts in application env
    opts = Keyword.merge(opts, [queue: queue, worker_pool: worker_pool])
    Application.put_env(:logger, name, opts)
    %{level: level, name: name, queue: queue}
      end

      defp tcp_worker(id, host, port, queue) do
        Supervisor.Spec.worker(Conference.Logging.TCPConnection,
          [host, port, queue, @connection_opts], id: id)
      end  

    defp log(event, state) do
        case Poison.encode(event) do
          {:ok, msg} ->
            BlockingQueue.push(state.queue, msg <> "\n")
          {:error, reason} ->
            IO.puts "Serialize error: #{inspect reason}, event: #{inspect event}"
        end
    end
end