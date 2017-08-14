defmodule Demo.RunChannel do
  use Phoenix.Channel

  def join("run", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("run_instance", payload, socket) do
    broadcast! socket, "run_instance", payload
    {:noreply, socket}
  end
end
