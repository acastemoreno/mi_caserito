defmodule MiCaserito.AuthController do
  use MiCaserito.Web, :controller
  plug Ueberauth

  def request(conn, _params) do
    text conn, "Holi, no debo aparecer"
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Fallo en la authenticacion.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: _auth}} = conn, _params) do
    text conn, "Holi, el callback recibio mi información"
  end
end