defmodule MiCaserito.LayoutView do
  use MiCaserito.Web, :view

  def logged_in?(conn) do
    Guardian.Plug.authenticated?(conn)
  end
end
