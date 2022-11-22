defmodule Pento.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:ratings, [:user_id])
    create index(:ratings, [:product_id])

    #Add a unique index since we want a user to only rate a given product once

    create unique_index(:ratings, [:user_id, :product_id], name: :index_ratings_on_user_product)

    #It’s just an Ecto index, but instead of specifying index we specify unique_index .
    #That way, our database will only allow one rating per [:user_id, :product_id] combination
  end
end
