defmodule MiCaserito.Authorization do
  use MiCaserito.Web, :model

  schema "authorizations" do
    field :provider, :string
    field :uid, :string
    field :token, :string
    field :refresh_token, :string
    field :expired_at, :integer
    belongs_to :user, MiCaserito.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:provider, :uid, :token, :refresh_token, :expired_at])
    |> validate_required([:provider, :uid, :token])
  end
end
