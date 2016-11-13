defmodule MiCaserito.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nombre, :string
      add :email, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
