defmodule Ptodos.Repo.Migrations.AddFinishedColumnToTodos do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :finished, :boolean, default: false
    end
  end
end
