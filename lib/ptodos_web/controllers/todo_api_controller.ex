defmodule PtodosWeb.TodoApiController do
  use PtodosWeb, :controller

  alias Ptodos.Todos
  alias Ptodos.Todos.Todo

  def toggle(conn, %{"id" => id}) do
    %Ptodos.Todos.Todo{finished: finished} = todo = Todos.get_todo!(id)

    case Todos.update_todo(todo, %{finished: !finished}) do
      {:ok, todo} ->
        render(conn, "toggle.json", %{state: todo.finished})
      {:error, _message} ->
        render(conn, "error.json", %{error: "hi"})
    end
  end

end
