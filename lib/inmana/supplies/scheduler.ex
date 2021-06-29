defmodule Inmana.Supplies.Scheduler do
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state \\ %{}) do
    send_notification()
    {:ok, state}
  end

  # def handle_cast({:put, key, value}, state) do
  #   {:noreply, Map.put(state, key, value)}
  # end

  # def handle_call({:get, key}, _from, state) do
  #   {:reply, Map.get(state, key), state}
  # end

  @impl true
  def handle_info(:generate, state) do
    ExpirationNotification.send()

    send_notification()

    {:noreply, state}
  end

  defp send_notification do
    Process.send_after(self(), :generate, 1000 * 10)
    # Process.send_after(self(), :generate, 1000 * 60 * 60 * 24 * 7)
  end
end
