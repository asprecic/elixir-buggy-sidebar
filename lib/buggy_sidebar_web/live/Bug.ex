defmodule BuggySidebarWeb.BugLive do
  use BuggySidebarWeb, :live_view

  def mount(%{"value" => value}, _session, socket) do
    {:ok, socket |> assign(:correct_value, value)}
  end

  def render(assigns) do
    ~H"""
    Value should be: <%= @correct_value %>
    <div>
    <button phx-click="clickme" phx-value-data="value1">value1</button>
    <button phx-click="clickme" phx-value-data="value2">value2</button>
    </div>
    """
  end

  def handle_event("clickme", %{"data" => value}, socket) do
    Phoenix.PubSub.broadcast(BuggySidebar.PubSub, "pubsub", {:msg, value})
    {:noreply, socket
               |> assign(:correct_value, value)
               |> push_redirect(to: "/bug/#{value}")
              }
  end
end
