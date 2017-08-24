defmodule Ptodos.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ptodos.Users.User


  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    has_many :todos, Ptodos.Todos.Todo

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end
end
