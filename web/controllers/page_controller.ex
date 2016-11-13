defmodule MiCaserito.PageController do
  use MiCaserito.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def logout(conn, _) do
	  conn
	  |> Guardian.Plug.sign_out()
	  |> put_flash(:info, "Se cerro la session exitosamente")
	  |> redirect(to: "/")
	end
end
