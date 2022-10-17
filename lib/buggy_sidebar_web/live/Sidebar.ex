defmodule BuggySidebarWeb.SidebarLive do
  use BuggySidebarWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket) do
      BuggySidebarWeb.Endpoint.subscribe("pubsub")
    end

    {:ok, socket |> assign(:content, "nothing for now")}
  end

  def render(assigns) do
    ~H"""
    Sidebar text: <%= @content %>
    """
  end

  def handle_info({:msg, msg}, socket) do
    {:noreply, socket |> assign(:content, msg)}
  end
end
