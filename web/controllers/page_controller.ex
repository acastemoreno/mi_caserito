defmodule MiCaserito.PageController do
  use MiCaserito.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  def gps(conn, _params) do
    render conn, "gps.html", url: "gps"
  end
end
