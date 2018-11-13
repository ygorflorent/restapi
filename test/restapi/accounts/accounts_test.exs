defmodule Restapi.AccountsTest do
  use Restapi.DataCase

  alias Restapi.Accounts

  describe "users" do
    alias Restapi.Accounts.User

    @valid_attrs %{"": "some ", age: "some age", email: "some email", password: "some password", stooge: "some stooge"}
    @update_attrs %{"": "some updated ", age: "some updated age", email: "some updated email", password: "some updated password", stooge: "some updated stooge"}
    @invalid_attrs %{"": nil, age: nil, email: nil, password: nil, stooge: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user. == "some "
      assert user.age == "some age"
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.stooge == "some stooge"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user. == "some updated "
      assert user.age == "some updated age"
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.stooge == "some updated stooge"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
