defmodule MiCaserito.UserTest do
  use MiCaserito.ModelCase

  alias MiCaserito.User

  @valid_attrs %{email: "some content", is_admin: true, nombre: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
