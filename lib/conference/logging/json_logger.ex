
defmodule Conference.Logging.JsonLogger do
    @moduledoc """
    Logger backend which logs to console in JSON format.
    """
    @behaviour :gen_event
    def init({__MODULE__, name}) do
      {:ok, configure(name, [])}
    end
    def handle_call({:configure, opts}, %{name: name}) do
      {:ok, :ok, configure(name, opts)}
    end
    defp configure(name, opts) do
      env = Application.get_env(:logger, name, [])
      opts = Keyword.merge(env, opts)
      Application.put_env(:logger, name, opts)
      level = Keyword.get(opts, :level, :info)
      %{level: level, name: name}
    end
    def handle_event({_level, group_leader, _info}, state)
      when node(group_leader) != node() do
    {:ok, state}
  end
  def handle_event({level, group_leader, {Logger, msg, ts, md}}, state) do
    if Logger.compare_levels(level, state.level) != :lt do
      log(event(level, msg, ts, md), state)
    end
    {:ok, state}
  end
  def handle_info(_msg, state) do
    {:ok, state}
  end
  def event(level, message, timestamp, metadata) do
    %{
      "@timestamp": format_date(timestamp) <> timezone(),
      level: level,
      message: to_string(message),
      module: metadata[:module],
      function: metadata[:function],
      line: metadata[:line]
    }
  end
  defp log(event, _state) do
    case Poison.encode(event) do
      {:ok, msg} ->
        IO.puts msg
      {:error, reason} ->
        IO.puts "Serialize error: #{inspect reason}, event: #{inspect event}"
    end
  end
  ## Timestamp shenanigans
  defp format_date({{year, month, day}, {hour, min, sec, millis}}) do
    {:ok, ndt} = NaiveDateTime.new(year, month, day,
                                   hour, min, sec, {millis, 3})
    NaiveDateTime.to_iso8601(ndt, :extended)
  end
  defp timezone() do
    offset = timezone_offset()
    minute = offset |> abs() |> rem(3600) |> div(60)
    hour   = offset |> abs() |> div(3600)
    sign(offset) <> zero_pad(hour, 2) <> ":" <> zero_pad(minute, 2)
  end
  defp timezone_offset() do
    t_utc = :calendar.universal_time()
    t_local = :calendar.universal_time_to_local_time(t_utc)
    s_utc = :calendar.datetime_to_gregorian_seconds(t_utc)
    s_local = :calendar.datetime_to_gregorian_seconds(t_local)
    s_local - s_utc
  end
  defp zero_pad(val, count) do
    num = Integer.to_string(val)
    :binary.copy("0", count - byte_size(num)) <> num
  end
  defp sign(total) when total < 0, do: "-"
  defp sign(_),                    do: "+"
end