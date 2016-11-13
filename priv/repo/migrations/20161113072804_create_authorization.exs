defmodule MiCaserito.Repo.Migrations.CreateAuthorization do
  use Ecto.Migration

  def change do
    create table(:authorizations) do
      add :provider, :string
      add :uid, :string
      add :token, :string
      add :refresh_token, :string
      add :expired_at, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:authorizations, [:user_id])

  end
end
