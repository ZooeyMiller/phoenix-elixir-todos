defmodule Ptodos.Repo.Migrations.AddFinished do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :finished, :boolean
    end
  end
end
