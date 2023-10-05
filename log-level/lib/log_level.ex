defmodule LogLevel do
  def to_label(label, legacy?) do
    cond do
      label === 0 and not legacy? -> :trace
      label === 1 -> :debug
      label === 2 -> :info
      label === 3 -> :warning
      label === 4 -> :error
      label === 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] ->
        :ops

      label === :unknown && legacy? ->
        :dev1

      label === :unknown && not legacy? ->
        :dev2

      true ->
        false
    end
  end
end
