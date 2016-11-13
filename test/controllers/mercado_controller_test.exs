defmodule MiCaserito.MercadoControllerTest do
  use MiCaserito.ConnCase

  alias MiCaserito.Mercado
  @valid_attrs %{direccion: "some content", latitud: "120.5", longitud: "120.5", nombre: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mercado_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing mercados"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mercado_path(conn, :new)
    assert html_response(conn, 200) =~ "New mercado"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mercado_path(conn, :create), mercado: @valid_attrs
    assert redirected_to(conn) == mercado_path(conn, :index)
    assert Repo.get_by(Mercado, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mercado_path(conn, :create), mercado: @invalid_attrs
    assert html_response(conn, 200) =~ "New mercado"
  end

  test "shows chosen resource", %{conn: conn} do
    mercado = Repo.insert! %Mercado{}
    conn = get conn, mercado_path(conn, :show, mercado)
    assert html_response(conn, 200) =~ "Show mercado"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mercado_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mercado = Repo.insert! %Mercado{}
    conn = get conn, mercado_path(conn, :edit, mercado)
    assert html_response(conn, 200) =~ "Edit mercado"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mercado = Repo.insert! %Mercado{}
    conn = put conn, mercado_path(conn, :update, mercado), mercado: @valid_attrs
    assert redirected_to(conn) == mercado_path(conn, :show, mercado)
    assert Repo.get_by(Mercado, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mercado = Repo.insert! %Mercado{}
    conn = put conn, mercado_path(conn, :update, mercado), mercado: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mercado"
  end

  test "deletes chosen resource", %{conn: conn} do
    mercado = Repo.insert! %Mercado{}
    conn = delete conn, mercado_path(conn, :delete, mercado)
    assert redirected_to(conn) == mercado_path(conn, :index)
    refute Repo.get(Mercado, mercado.id)
  end
end
