defmodule PentoWeb.PromoLive do

  use PentoWeb, :live_view

  alias Pento.Promo
  alias Pento.Promo.Receipient

  def mount(_params, _session, socket) do
    {:ok,
        socket
        |> assign_receipient()
        |> assign_changeset()}
  end

  def assign_receipient(socket) do
    socket
    |> assign(:receipient, %Receipient{})
  end

  def assign_changeset(%{assigns: %{receipient: receipient}} = socket) do
    socket
    |> assign(:changeset, Promo.change_receipient(receipient))
  end

  def handle_event("validate", %{"receipient" => receipient_params}, socket) do
    changeset =
      socket.assigns.receipient
      |> Promo.change_receipient(receipient_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"receipient" => _receipient_params}, _socket) do
    :timer.sleep 1000
  end

end
