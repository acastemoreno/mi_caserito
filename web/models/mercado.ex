defmodule MiCaserito.Mercado do
  use MiCaserito.Web, :model

  schema "mercados" do
    field :nombre, :string
    field :latitud, :float
    field :longitud, :float
    field :direccion, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nombre, :latitud, :longitud, :direccion])
    |> validate_required([:nombre, :latitud, :longitud, :direccion])
  end
end
