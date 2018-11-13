defmodule RestapiWeb.UserView do
  use RestapiWeb, :view
  alias RestapiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password: user.password,
      age: user.age,
      stooge: user.stooge,
    }
  end
end
