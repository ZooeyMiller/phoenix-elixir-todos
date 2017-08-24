defmodule PtodosWeb.AuthController do
  use PtodosWeb, :controller
  plug Ueberauth

  alias Ptodos.Users
  alias Ptodos.Users.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    signin(conn, %{token: auth.credentials.token, email: auth.info.email, provider: "github"})
  end

  def signout(conn, _params) do
    conn
    |> put_flash(:info, "Signed out")
    |> configure_session(drop: true)
    |> redirect(to: todo_path(conn, :index))
  end

  defp signin(conn, user_params) do
    case insert_or_update_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: todo_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: todo_path(conn, :index))
    end
  end

  defp insert_or_update_user(user) do
    case Users.get_by_email(user.email) do
      nil ->
        Users.create_user(user)
      user ->
        {:ok, user}
    end
  end
end
