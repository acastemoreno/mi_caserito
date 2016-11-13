defmodule MiCaserito.Repo.Migrations.CreateMercado do
  use Ecto.Migration

  def change do
    create table(:mercados) do
      add :nombre, :string
      add :latitud, :float
      add :longitud, :float
      add :direccion, :string

      timestamps()
    end

  end
end
