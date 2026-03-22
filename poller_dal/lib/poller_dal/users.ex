defmodule PollerDal.Users do
  alias PollerDal.Repo
  alias PollerDal.Users.User

  def list_users, do: Repo.all(User)
  
  def get_user!(id), do: Repo.get!(User, id)
  
  def get_user_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end
  
  def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
  
  def put_admin(%User{} = user, admin \\ true) do
    user
    |> User.admin_changeset(%{admin: admin})
    |> Repo.update()
  end
  
  def authenticate(email, password) do
    user = get_user_by_email(email)
    if user && Argon2.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_credentials}
    end
  end
  
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end
end
