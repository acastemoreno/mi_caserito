defmodule MiCaserito.AuthController do
  use MiCaserito.Web, :controller
  plug Ueberauth
  alias MiCaserito.UserFromAuth
  alias MiCaserito.User

  def request(conn, _params) do
    text conn, "Holi, no debo aparecer"
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Fallo en la authenticacion.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.get_or_insert(auth, Repo) do
      {:ok, %User{is_admin: false} = user} ->
        conn
        |> Guardian.Plug.sign_in(user, :token, perms: %{ default: [:read]})
        |> redirect(to: page_path(conn, :index))
      {:ok, %User{is_admin: true} = user} ->
        conn
          |> Guardian.Plug.sign_in(user, :token, perms: %{ admin: [:dashboard]})
          |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        IO.inspect changeset
        conn
        |> put_flash(:error, "Fallo en la authenticacion.")
        |> redirect(to: "/")
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:warning, "Logueo es necesario")
    |> redirect(to: page_path(conn, :index))
  end
end
