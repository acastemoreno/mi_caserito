defmodule MiCaserito.User do
  use MiCaserito.Web, :model

  schema "users" do
    field :nombre, :string
    field :email, :string
    field :is_admin, :boolean, default: false
    has_one :authorization, MiCaserito.Authorization

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :is_admin])
    |> validate_required([:nombre, :is_admin])
  end
end
