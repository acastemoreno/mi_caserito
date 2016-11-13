defmodule MiCaserito.MercadoTest do
  use MiCaserito.ModelCase

  alias MiCaserito.Mercado

  @valid_attrs %{direccion: "some content", latitud: "120.5", longitud: "120.5", nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mercado.changeset(%Mercado{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mercado.changeset(%Mercado{}, @invalid_attrs)
    refute changeset.valid?
  end
end
