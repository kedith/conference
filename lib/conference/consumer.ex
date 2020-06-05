defmodule Conference.Consumer do
  use GenServer
  use AMQP
  alias Conference.Repository.UserDetailsRepo, as: Repo

  def start_link(_otps) do
    GenServer.start_link(__MODULE__, [], [])
  end
  @exchange    "gen_server_test_exchange"
  @queue       "gen_server_test_queue"
  @queue_error "#{@queue}_error"

  def init(_opts) do
    hostname = System.get_env("RABBITMQ_HOST")
    username = System.get_env("RABBITMQ_DEFAULT_USER")
    password = System.get_env("RABBITMQ_DEFAULT_PASS")
    options = [host: hostname, port: 5672, virtual_host: "/", username: username, password: password]

    {:ok, conn} = Connection.open(options, :undefined)
    {:ok, chan} = Channel.open(conn)
    setup_queue(chan)

    # Limit unacknowledged messages to 10
    :ok = Basic.qos(chan, prefetch_count: 10)
    # Register the GenServer process as a consumer
    {:ok, _consumer_tag} = Basic.consume(chan, @queue)
    {:ok, chan}
  end

  # Confirmation sent by the broker after registering this process as a consumer
  def handle_info({:basic_consume_ok, %{consumer_tag: consumer_tag}}, chan) do
    {:noreply, chan}
  end

  # Sent by the broker when the consumer is unexpectedly cancelled (such as after a queue deletion)
  def handle_info({:basic_cancel, %{consumer_tag: consumer_tag}}, chan) do
    {:stop, :normal, chan}
  end

  # Confirmation sent by the broker to the consumer process after a Basic.cancel
  def handle_info({:basic_cancel_ok, %{consumer_tag: consumer_tag}}, chan) do
    {:noreply, chan}
  end

  def handle_info({:basic_deliver, payload, %{delivery_tag: tag, redelivered: redelivered}}, chan) do
    # You might want to run payload consumption in separate Tasks in production
    consume(chan, tag, redelivered, payload)
    {:noreply, chan}
  end

  defp setup_queue(chan) do

    {:ok, _} = Queue.declare(
      chan,
      @queue,
      durable: true
    )
    :ok = Exchange.fanout(chan, @exchange, durable: true)
    :ok = Queue.bind(chan, @queue, @exchange)
  end

  defp consume(channel, tag, redelivered, payload) do
    IO.inspect(payload)
    data = Poison.decode!(payload)
           |> IO.inspect()
    Repo.insert_data_from_rabbitmq(data)
    :ok = Basic.ack channel, tag
  end
end