defmodule Restapi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, unique: true
      add :password, :string, size: 10
      add :age, :integer
      add :stooge, :string

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
