defmodule Ptodos.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ptodos.Teams.Team


  schema "teams" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
