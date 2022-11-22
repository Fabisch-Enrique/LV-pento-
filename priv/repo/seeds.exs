# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule Pento.Repo.Seeds do
  alias Pento.Accounts.User
  alias Pento.Catalog.Product

  def run(env) do
    insert_product(env)
    insert_user(env)
  end

  defp insert_user(_) do
    users =
    [
      %{
        email: "drenriquenicol@gmail.com",
        password: "nicole##enrique"
      },
      %{
        email: "fabby@gmail.com",
        password: "fabischenrique"
        }
    ]

  |> put_timestamps()

  Repo.insert_all(Pento.Accounts.User, users)
  end

  defp insert_product(_) do
    products =
    [
      %{
         name: "Candy Crash",
         description: "This is a Fruit Game",
         unit_price: 45.90,
         sku: 233454
       },
       %{
         name: "Tic-Tac-Toe",
         description: "A Game that Involves Xs amd Os",
         unit_price: 56.78,
         sku: 87980
        }
    ]

    |> put_timestamps()

  Repo.insert_all(Pento.Catalog.Product, products)
  end

  defp put_timestamps(entries) do
    entries
    |> Enum.map(&Map.merge(&1, %{
      inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
      updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    }))
  end
end

Pento.Repo.Seeds.run(Mix.env())
