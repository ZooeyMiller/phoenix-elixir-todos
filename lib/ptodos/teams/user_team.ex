defmodule Ptodos.Teams.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ptodos.Teams.UserTeam


  schema "user_teams" do
    field :user_id, :id
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(%UserTeam{} = user_team, attrs) do
    user_team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
