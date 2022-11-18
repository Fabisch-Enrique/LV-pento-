defmodule Pento.Promo.Receipient do
  defstruct [:first_name, :email]

  @types %{first_name: :string, email: :string}

  alias Pento.Promo.Receipient
  import Ecto.Changeset

  def changeset(%Receipient{} = user, attrs) do
    {user, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:first_name, :email])
    |> validate_format(:email, ~r/@/)
  end

end
