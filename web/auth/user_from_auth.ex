defmodule MiCaserito.UserFromAuth do
  alias MiCaserito.User
  alias MiCaserito.Authorization
  alias Ueberauth.Auth
  import Ecto

  def get_or_insert(%Auth{provider: :facebook} = auth, repo) do
    repo.get_by(Authorization, uid: auth.uid, provider: "facebook")
      |> create_or_get(auth, repo)
  end

  defp create_or_get(nil, auth, repo) do
    user = User.changeset(%User{}, %{email: auth.info.email, nombre: name_from_auth(auth), is_admin: false})
    |> repo.insert!()
    |> build_assoc(:authorization)
    user |> Authorization.changeset(%{
        provider: to_string(auth.provider),
        uid: auth.uid,
        token: auth.credentials.token,
        refresh_token: auth.credentials.refresh_token,
        expires_at: auth.credentials.expires_at
      })
    |> repo.insert()
  end

  defp create_or_get(%Authorization{} = auth, _auth, repo) do
    {:ok, auth
      |> assoc(:user)
      |> repo.one}
  end

  ## Helper functions
  ####
  defp name_from_auth(auth) do
    do_name_from_auth(auth.info.name, auth.info.first_name)
  end

  defp do_name_from_auth(nil, first_name) do
    first_name
  end

  defp do_name_from_auth(name, _) do
    name
  end
end
