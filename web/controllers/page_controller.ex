defmodule MiCaserito.PageController do
  use MiCaserito.Web, :controller
  alias HTTPotion.Response

  def index(conn, _params) do
    render conn, "index.html"
  end
end
