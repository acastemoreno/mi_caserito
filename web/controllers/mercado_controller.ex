defmodule MiCaserito.MercadoController do
  use MiCaserito.Web, :controller

  alias MiCaserito.Mercado
  use Guardian.Phoenix.Controller

  plug Guardian.Plug.EnsureAuthenticated, handler: MiCaserito.AuthController

  def index(conn, _params, _userlog, _claims) do
    mercados = Repo.all(Mercado)
    render(conn, "index.html", mercados: mercados)
  end

  def new(conn, _params, _userlog, _claims) do
    changeset = Mercado.changeset(%Mercado{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mercado" => mercado_params}, _userlog, _claims) do
    changeset = Mercado.changeset(%Mercado{}, mercado_params)

    case Repo.insert(changeset) do
      {:ok, _mercado} ->
        conn
        |> put_flash(:info, "Mercado created successfully.")
        |> redirect(to: mercado_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, _userlog, _claims) do
    mercado = Repo.get!(Mercado, id)
    render(conn, "show.html", mercado: mercado)
  end

  def edit(conn, %{"id" => id}, _userlog, _claims) do
    mercado = Repo.get!(Mercado, id)
    changeset = Mercado.changeset(mercado)
    render(conn, "edit.html", mercado: mercado, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mercado" => mercado_params}, _userlog, _claims) do
    mercado = Repo.get!(Mercado, id)
    changeset = Mercado.changeset(mercado, mercado_params)

    case Repo.update(changeset) do
      {:ok, mercado} ->
        conn
        |> put_flash(:info, "Mercado updated successfully.")
        |> redirect(to: mercado_path(conn, :show, mercado))
      {:error, changeset} ->
        render(conn, "edit.html", mercado: mercado, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, _userlog, _claims) do
    mercado = Repo.get!(Mercado, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mercado)

    conn
    |> put_flash(:info, "Mercado deleted successfully.")
    |> redirect(to: mercado_path(conn, :index))
  end
end
