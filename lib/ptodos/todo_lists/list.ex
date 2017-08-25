defmodule Ptodos.TodoLists.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ptodos.TodoLists.List


  schema "lists" do
    field :title, :string
    has_many :todos, Ptodos.Todos.Todo
    timestamps()
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
