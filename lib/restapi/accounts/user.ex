defmodule Restapi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :age, :integer
    field :email, :string
    field :password, :string
    field :stooge, :string

    timestamps()
  end

  @required_fields ~w(email password age stooge)
  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, @required_fields)
    |> unsafe_validate_unique([:email], Restapi.Repo, message: "email is already in use")
    |> unique_constraint(:email)
    |> validate_required([:email, :password, :age, :stooge])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6)
  end
end
