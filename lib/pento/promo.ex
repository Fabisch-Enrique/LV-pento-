defmodule Pento.Promo do
  alias Pento.Promo.Receipient

  def change_receipient(%Receipient{} = receipient, attrs \\ %{}) do
    Receipient.changeset(receipient, attrs)
  end

  def send_promo(receipient, attrs) do
    #send email to a promo receipient
  end
end
